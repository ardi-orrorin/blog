class FileController(
    val fileProvider: FileProvider,
    val memberService: MemberService,
    val resizeImg: ResizeImage,
) {
    val log: Logger = LoggerFactory.getLogger(this.javaClass)

    fun extValidation(ext: String, fileType: FileType ) {
        when (fileType) {
            FileType.IMAGE -> {
                if (!fileProvider.FILE_IMAGES.contains(ext))
                    throw InvalidFile("허용되지 않은 요청입니다.")
            }
            FileType.VIDEO -> {
                if (!fileProvider.FILE_VIDEOS.contains(ext))
                    throw InvalidFile("허용되지 않은 요청입니다.")
            }
            FileType.FILE -> {
                if (!fileProvider.FILE_APPS.contains(ext))
                    throw InvalidFile("허용되지 않은 요청입니다.")
            }
            else -> throw InvalidFile("허용되지 않은 요청입니다.")
        }
    }

    @GetMapping("/osdir")
    fun getOSDIR(): ResponseEntity<ResponseDTO<String>> {


        log.info("[{}]({}) {} : {}",
            object{}.javaClass.enclosingClass.name,
            object{}.javaClass.enclosingMethod.name,
            "windows", fileProvider.windowsFileDir
        )

        log.info("[{}]({}) {} : {}",
            object{}.javaClass.enclosingClass.name,
            object{}.javaClass.enclosingMethod.name,
            "linux", fileProvider.linuxFileDir
        )

        return ResponseEntity.ok(
            ResponseDTO(
                status = HttpStatus.OK.value(),
                data = fileProvider.getOsDir()
            )
        )
    }

    @PostMapping("upload")
    fun uploadFile(
        @RequestPart("file") multipartFile: List<MultipartFile>,
        @RequestPart("input") input: Map<String, String>,
        @AuthenticationPrincipal memberDTO: MemberDTO,
    ): ResponseEntity<ResponseDTO<String>> {

        val userKey = memberService.loadByMemberId(memberDTO.userId).id!!.toInt()

        multipartFile.forEach{
            fileProvider.writeFile(it.bytes, it.originalFilename!!, userKey)
        }

        return ResponseEntity.ok(ResponseDTO(HttpStatus.OK.value(), "파일 업로드 성공"))
    }

    @GetMapping("/media/image/{id}/{fileName}")
    fun getMediaFile(
        @PathVariable id: Int,
        @PathVariable fileName: String,
        @RequestParam(required = true, defaultValue = "true") thumnail: Boolean,
        @RequestParam(required = false) size: Int?,
    ): ResponseEntity<ByteArray> {

        val ext: String = fileName.substring(fileName.lastIndexOf(".") + 1)

        // 해당 요청 주소는 이미지만 처리하는 주소이므로 이미지 확장자만 허용
        extValidation(ext, FileType.IMAGE)

        val file = File(fileProvider.getOsDir() + "/${id}/images/" + fileName)
        var oFile = file.readBytes()

        // 섬네일 생성
        if(thumnail) {
            oFile = resizeImg
                .read(file)
                .scale(size ?: 500, ResizeCriteria.HEIGHT)
                .readThumnail(ext)
        }

        val headers = HttpHeaders()

        // 캐시 설정으로 서버 부하 축소
        headers.cacheControl = "public, max-age=" + 24 * 60 * 60
        headers.contentType = MediaType("image", ext)

        return ResponseEntity(oFile, headers, HttpStatus.OK)
    }

    @GetMapping("/media/video/{id}/{fileName}")
    fun getVideoFile(
        @PathVariable id: Int,
        @PathVariable fileName: String
    ): ResponseEntity<ByteArray> {

        val ext: String = fileName.substring(fileName.lastIndexOf(".") + 1)

        extValidation(ext, FileType.VIDEO)

        val file = File(fileProvider.getOsDir() + "/${id}/video/" + fileName)

        log.info("[{}]({}) {} : {}",
            object{}.javaClass.enclosingClass.name,
            object{}.javaClass.enclosingMethod.name,
            "file", file
        )

        val headers = HttpHeaders()
        headers.accessControlMaxAge = 60 * 60 * 24
        headers.cacheControl = "public, max-age=31536000"
        headers["Accept-Ranges"] = "bytes"
        headers["contentRange"] = "bytes 0-${file.length() - 1}/${file.length()}"
        headers.contentLength = file.length()

        headers.contentType = MediaType("video",ext)

        return ResponseEntity(file.readBytes(), headers, HttpStatus.OK)
    }

}