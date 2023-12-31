/*:
## Exercise - Computed Properties and Property Observers
 
 The `Rectangle` struct below has two properties, one for width and one for height. Add a computed property that computes the area of the rectangle (i.e. width * height). Create an instance of `Rectangle` and print the `area` property.
 */
/*:
Структура Rectangle ниже имеет два свойства: одно для ширины и одно для высоты. Добавьте вычисляемое свойство, которое вычисляет площадь прямоугольника (т. е. ширина * высота). Создайте экземпляр Rectangle и напечатайте свойство area.
 */
struct Rectangle {
    var width: Int
    var height: Int
    var area : Int {
          width * height
        
    }
}
var exRectangle = Rectangle(width: 6, height: 7)
print(exRectangle.area)



/*:
 In the `Height` struct below, height is represented in both inches and centimeters. However, if `heightInInches` is changed, `heightInCentimeters` should also adjust to match it. Add a `didSet` to each property that will check if the other property is what it should be, and if not, sets the proper value. If you set the value of the other property even though it already has the right value, you will end up with an infinite loop of each property setting the other.
 
 Create an instance of `Height` and then change one of its properties. Print out the other property to ensure that it was adjusted accordingly.
 */

/*:
 В приведенной ниже структуре `Height` высота представлена ​​как в дюймах, так и в сантиметрах. Однако, если `heightInInches` изменено, `heightInCentimeters` также должно измениться, чтобы соответствовать ему. Добавьте `didSet` к каждому свойству, которое будет проверять, является ли другое свойство тем, чем оно должно быть, и если нет, устанавливает правильное значение. Если вы установите значение другого свойства, даже если оно уже имеет правильное значение, вы получите бесконечный цикл, когда каждое свойство устанавливает другое.
 
 Создайте экземпляр `Height`, а затем измените одно из его свойств. Распечатайте другое свойство, чтобы убедиться, что оно настроено соответствующим образом.
 */
struct Height {
    var heightInInches: Double{
        didSet{
            let centimeters = heightInInches * 2.54
            if centimeters != heightInCentimeters{
                heightInCentimeters = centimeters
            }
        }
    }
    
    
    var heightInCentimeters: Double{
        didSet{
            let inches = heightInCentimeters / 2.54
            if heightInInches != inches {
                heightInInches = inches
            }
        }
    }
    
    init(heightInInches: Double) {
        self.heightInInches = heightInInches
        self.heightInCentimeters = heightInInches*2.54
    }
    
    init(heightInCentimeters: Double) {
        self.heightInCentimeters = heightInCentimeters
        self.heightInInches = heightInCentimeters/2.54
    }
}

let exHeight = Height(heightInInches: 8)
print(exHeight.heightInCentimeters) 
/*:
[Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Mile Times and Congratulations](@next)
 */
