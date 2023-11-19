@Configuration
@EnableWebSecurity
class SpringSecurityConfig() {}


@Configuration
@EnableWebSecurity
class SpringSecurityConfig() {

    @Bean
    fun configure(): WebSecurityCustomizer {
        return WebSecurityCustomizer {
            // 경로상에서 보안 필터에서 제외할 경로를 설정한다.
            it.ignoring().requestMatchers("/css/**", "/js/**", "/img/**", "/lib/**")
        }
    }
}

@Bean
fun securityFilterChain(http: HttpSecurity) : SecurityFilterChain {
        return http
}

@Bean
fun securityFilterChain(http: HttpSecurity) : SecurityFilterChain {
    // 개발시할 때만 사용하는 CORS 설정
    return http.cors {
           it.configurationSource {
               val config = CorsConfiguration()
               config.addAllowedOrigin("*")
               config.addAllowedHeader("*")
               config.addAllowedMethod("*")
               config
           }
       }
}

@Bean
fun securityFilterChain(http: HttpSecurity) : SecurityFilterChain {
    return http.cors {
           it.configurationSource {
               val config = CorsConfiguration()
               config.allowedOrigins = listOf("https://domain.com:433","http://domain.com:80")
               config.addAllowedHeader("*")
               // 각각 하나씩 설정 가능
               config.addAllowedMethod(HttpMethod.GET)
               config.addAllowedMethod(HttpMethod.POST)
               config.addAllowedMethod(HttpMethod.PUT)
               config.addAllowedMethod(HttpMethod.DELETE)
               config.addAllowedMethod(HttpMethod.OPTIONS)
               // 리스트로 설정가능
               config.allowedMethods = listOf("GET","POST","PUT","DELETE","OPTIONS")
               config
           }
       }
}

@Bean
fun securityFilterChain(http: HttpSecurity) : SecurityFilterChain {
    return http.csrf {
//            it.disable() // 개발시 csrf 비활성화
              // XSRF-TOKEN 쿠키를 사용하도록 설정
              it.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
           }
}
