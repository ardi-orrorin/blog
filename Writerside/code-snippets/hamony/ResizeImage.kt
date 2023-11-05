class ResizeImage{

    var scale: Double? = null

    private var setScale: Boolean = false

    private var bImage: BufferedImage? = null

    fun read(file: File): ResizeImage {
        this.bImage = ImageIO.read(file)
        return this
    }

    /**
     * default scale 500
     */
    fun scale(criteria: ResizeCriteria): ResizeImage {
        scale(500, criteria)
        return this
    }

    fun scale(size: Int, criteria: ResizeCriteria): ResizeImage {
        if(this.bImage == null) {
            throw Exception("이미지를 먼저 읽어주세요.")
        }

        // 1이상의 오버 비율에 대한 검증 함수
        fun validOverScale(tempScale: Double): Double {
            if (tempScale >= 1.0) {
                return 1.0
            } else {
                return tempScale
            }
        }

        when (criteria) {
            ResizeCriteria.HEIGHT ->
                this.scale = validOverScale(size / bImage!!.height.toDouble())
            ResizeCriteria.WIDTH ->
                this.scale = validOverScale(size / bImage!!.width.toDouble())
            else -> throw Exception("잘못된 기준 입니다.")
        }
        this.setScale = true
        return this
    }

    fun readThumnail(ext: String): ByteArray {
        val bufImage: BufferedImage = resize()

        val baos: ByteArrayOutputStream = ByteArrayOutputStream()
        ImageIO.write(bufImage, ext, baos)

        return baos.toByteArray()
    }

    fun writeThumnail(file: File, ext: String): Boolean {
        val bufImage: BufferedImage = resize()

        if (!file.isDirectory)
            file.mkdirs()

        ImageIO.write(bufImage, ext, file)

        return true
    }

    private fun resize(): BufferedImage {
        if (bImage == null) {
            throw Exception("이미지를 먼저 읽어주세요.")
        } else if (!this.setScale) {
            // 스케일 메소드를 호출 하지 않을 경우 길이가 긴쪽을 기준으로 스케일 계산
            if (this.bImage!!.height > this.bImage!!.width)
                scale(this.bImage!!.height, ResizeCriteria.HEIGHT)
            else
                scale(this.bImage!!.width, ResizeCriteria.WIDTH)
        }

        val oWidth: Int = (bImage!!.width.toDouble() * this.scale as Double).toInt()
        val oHeight: Int = (bImage!!.height.toDouble() * this.scale as Double).toInt()

        val bufImage = BufferedImage(oWidth, oHeight, BufferedImage.TYPE_3BYTE_BGR)

        val graphic: Graphics2D = bufImage.createGraphics()

        val image: Image = bImage!!.getScaledInstance(oWidth, oHeight, Image.SCALE_FAST)

        graphic.drawImage(image, 0, 0, oWidth, oHeight, null)
        graphic.dispose()

        return bufImage
    }

}