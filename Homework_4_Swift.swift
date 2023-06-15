/** 1. Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов) */

enum TypePizza{
    case pipperoni
    case toscana
    case margherita
    case carbonara
}

/** 2. Создать структуру пиццы, она должна содержать стоимость,
 вид пиццы, толстое или тонкое тесто и добавки 
 (например, дополнительно добавить пепперони, помидоры, сыр). 
 Вид пиццы должен быть вложенным типом для структуры пиццы. 
 Подсказка: добавки лучше также сделать перечислением. 
*/

struct Pizza{
    var type: TypePizza
    var cost: Double
    var dough: DoughSize
    var ingredients: Ingredient

    enum Ingredient{
        case tomato
        case cheese
        case bacon
        case pipperoni
    }
    enum DoughSize{
        case tk
        case tn

        init (size: String){
          switch size {
            case "think": self = .tk
            case "thin": self = .tn
            default: self = .tn
          }
        }
    }  
}

/** 3.Создать класс пиццерии, добавить массив с возможными пиццами.
 Переменная с массивом должна быть приватной. 
 Массив задается в инициализаторе.
 */
 class Pizzeria{
    private var pizza: [Pizza]

    init(pizza: [Pizza]){
        self.pizza = pizza
    }
 

 /** 4. Написать в классе пиццерии функции для добавления новой пиццы
  и для получения всех доступных пицц. 
*/

  func addPizza(pizza: Pizza){
    self.pizza.append(pizza)
  }
  func getPizza(){
    print("Вид пиццы: \(.typePizza), стоимость: \(cost)")
  
  var pipperoni = Pizza(type: .pipperoni, cost: 450, dough: .tk, ingredients: .cheese)
     }
 }
/** 5. Создать экземпляр класса пиццерии и добавить 
в него несколько пицц.
 */
let pipperoni = Pizza(type: .pipperoni, cost: 450, dough: .tn, ingredients: .tomato)
let carbonara = Pizza(type: .carbonara, cost: 300, dough: .tk, ingredients: .cheese)

var pizzeria = Pizzeria(pizza: [pipperoni, carbonara])