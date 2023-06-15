//1.Написать функцию, которая будет решать квадратное уравнение.
// На вход функция получает коэффициенты a, b, c, d (ax^2 + bx+ c = d),
// а возвращает корни уравнения.
func res(a: Int, b: Int, c: Int, d: Int) -> (Double?, Double?){
    let finalC = c - d
    let discr = calculate(a: a, b: b, c: finalC)
    let xSqrt = sqrt(Double(discr))
    if (discr < 0){
        return (nil, nil) 
    }else if (discr == 0){
        let x1 = Double((-b + Int(xSqrt)))/Double((2 * a))
        return (x1, nil)
    }else if (discr > 0){
        let x1 = Double((-b + Int(xSqrt)))/Double((2 * a))
        let x2 = Double((-b - Int(xSqrt)))/Double((2 * a))
        return (x1, x2)
    }
    return (nil, nil)
    
}


// 2. Создать перечисление с видами чая (black, fruit, green),
// далее создать структуру, в которой будет хранится вид чая и 
//его стоимость.

enum TeaType{
    case black
    case fruit
    case creen
}
struct Tea{
    var name: TeaType
    var cost: Double
}
// 3. Создать класс Cafe, в котором хранится массив с чаем.
// Переменная с массивом должна быть приватной.
// Значение в массив должно устанавливаться в инициализаторе.
class Cafe{
    private var tea: [Tea]

    init(tea: [Tea]){
        self.tea = tea
    }
}

//4. Добавить в структуру чая функцию getCost, 
//которая будет возвращать стоимость чая.
// На вход функция принимает процент скидки (только целое число), 
//который необходимо применить к стоимости.
// Если скидка больше 50% напечатать в консоль о невозможности
// применить скидку и вернуть изначальную стоимость чая.
struct Tea{
    var name: TeaType
    var cost: Double

    func getCost(sale: Int) -> Double{
        guard sale <= 50 else{
            print("Невозможно вернуть значение")
            return cost
        }
        return cost * Double(sale) / 100
    }
}

// 5. Добавить в класс функцию, которая на вход принимает тип чая 
//и скидку, которую нужно применить. 
// Функция должна вернуть стоимость, 
//которую должен заплатить покупатель.
// Если данного вида чая нет в массиве(меню) - вернуть nil.

class Cafe{
    private var tea:[Tea]
    init(tea: [Tea]){
        self.tea = tea
    }
    func getCost(name: TeaType, sale: Int) -> Double?{
        guard let oneTea = tea.first { $0.name == name} else {
            return nil
        }  
        return oneTea.getCost(sale: sale)
    }
}
let a = Tea(name: .green, cost: 200)
let cafe = Cafe(tea: [Tea(name: .black, cost: 200), a])
cafe.getCost(name: .black, sale: 40)
cafe.getCost(name: .green, sale: 60)