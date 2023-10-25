package `03_DataTypes`

import java.io.PipedReader
import kotlin.reflect.typeOf

fun main() {
    // 묵시적 타입 선언
    val num = 5         // Int
    val double = 5.99   // Double
    val char = 'D'      // Char
    val boolean = true  // Boolean
    val text = "hello"  // String

    // 명시적 선언
    val num2: Int = 6
    val double2: Double = 6.99
    val char2: Char = 'D'
    val boolean2: Boolean = true
    val text2: String = "hello2"

    // DataType Numbers Group
    val numb: Byte = 1;
    val numS: Short = 1;
    val numI: Int = 1;
    val numL: Long = 1L;

    val numI1 = 2147483647  // Int
    val numI2 = 2147483648  // Long

    val numF2: Float = 5.75F
    val numD2: Double = 19.99


    // DataType Characters Group
    val grade: Char = 'B'
//    val letter: Char = 66 // error 자바와 달리 ASCII 코드로 변환환이 불가능

    // Type Conversion
    val x: Int = 66
//    val y: Long = x; // error
//    val y: Long = (Long)x // error
    val y: Long = x.toLong() // 66
    val z: Char = x.toChar() // B
    println(y)
    println(z)

    // 변수 선언시 묵시적 명시적으로 타입이 지정되어야 한다.
//    var name
//    name = "Test"  // error

    var name: String
    name = "Test "

    println(name[1]) // e
    println(name.length) // 길이

    // Other Types
    // Any 무엇이든 가능한 타입
    val other1: Any = 12;

    // Unit 리턴값이 없다는 의미
    // Unit 싱글톤 인스턴스이다. 타입이면서 객체를 의미하며 Any의 자식 즉 서브클래스이다.
    // 보통 함수에서 사용
//    val other2: Unit = 12; // error
    val other2: Unit;



}