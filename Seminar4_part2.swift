//1. Сделать тип чая вложенным типом для структуры чая.

struct Tea{
enum TeaType{
    case black
    case green
    case fruit
   }
var type: Tea
private var cost: Double

init(type: TeaType, cost: Double){
    self.type = type
    self.cost = cost
 }   
}

//2. Сделать так, чтобы в структуре чая можно было получить
// стоимость только через функцию getCost, 
//то есть чтобы извне функции не было доступа к переменной
// со стоимостью чая.
class Tea{
    private var tea: [Tea]

    func getCost(cost: Double) -> Double{

    }
}
//3. Создать класс Person, внутри которого должна быть
// структура Activity, внутри которой должно быть перечисление 
//TypeOfActivity (тип активности) с тремя кейсами:
// pupil, student, employee. Создать переменную и явно указать 
//ей тип “тип активности”.

 class Person{
    struct Activity{
        enum TypeOfActivity{
            case pupil
            case student
            case employee
        }
    }
 }
 let TypeOfActivity: Person.Activity.TypeOfActivity

 /** 4.Добавить в класс Cafe функцию,
  которая на основе типа активности, 
  предложенной суммы и возможной скидки возвращает доступный чая.
   Чай выбирается по следующим критериям: если это pupil, 
   то доступен и черный, и зеленый, и фруктовый чай.
    Если это student, то только черный, а если employee,
     то черный и фруктовый. 
     Если предложенной суммы хватает на все доступные виды чая, 
     то вернуть самый дорогой. Если суммы хватает только на один, 
     то вернуть его. Если суммы хватает на несколько доступных 
      видов чая, но у них одинаковая стоимость,
       то вернуть любой из них.
        Если суммы не хватает ни на один вид чая, то вернуть nil.
*/
enum TeaType{
    case black
    case fruit
    case green
}
struct Tea {
    let type: TeaType
    let price: Double
}
class Cafe{
    private var tea: [Tea]
    
    init(tea:[Tea]) {
        self.tea = tea        
    }
    // func getPrice(type: TeaType, discont: Double) -> Double{
    //     guard let teea = tea.first(where:{$0.type == type})else{
    //         return nil
    //     }
    //     return teea.getCost(discont)
    //     }

    //     func need(toa: TeaType, discont: Int)->Tea{
            
    //         switch toa{
    //         case pupil: var allTea = tea.filter{$0.getCost(getTeaPrice: discont) <= summ}.sorted($1.getCost(getTeaPrice: discont) < $0.getCost(getTeaPrice: discont))
    //         return allTea.first
    //         case student: var onlyblack = tea.filter{$0.getCost(getTeaPrice: discont) <= summ && $0.type == .black}.sorted($1.getCost(getTeaPrice: discont) < $0.getCost(getTeaPrice: discont))
    //         return onlyblack.first
    //         case employee: var balcandfruit = tea.filter{$0.getCost(getTeaPrice: discont) <= summ && ($0.type == .black || &0.type.fruit)}.sorted($1.getCost(getTeaPrice: discont) < $0.getCost(getTeaPrice: discont))
    //         return balcandfruit   
    //         }
    //     }
    // }
    
    func getCost(type: TeaType, sale: Int) -> Double?{
        guard let oneTea = tea.first { $0.type == type} else{
            return nil
        }
        return oneTea.getCost(sale: sale)
    }

    func getTea(activity: Person.Activity.TypeOfActivity, cost: Double, sale: Int) -> Tea?{
        switch activity{
            case .pupil:
                let givenTea = tea.filter {$0.getCost(sale: sale) <= cost}.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
                return givenTea.first
                case .student:
                let givenTea = tea.filter { $0.type == .black && $0.getCost(sale: sale)}
                return givenTea.first
                case employee:
                let givenTea = tea.filter { ($0.type == .black || $0.type == .fruit) && $0.getCost(sale: sale) > $1.getCost(sale: sale)}
                return givenTea.first 
        }
    }
}