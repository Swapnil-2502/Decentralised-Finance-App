import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank{
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 1228768746982374983;

  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func lower(amount: Float) {

    let tempValue : Float = currentValue - amount;
    if (tempValue >=0 ){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount is greater the currentValue");
    }
    
  };

  
  public query func checkBalance(): async Float{
    return currentValue;
  };
  
  public func compund(){
    let currenTime = Time.now();
    let timeElaspedNS = currenTime - startTime;
    let timeElaspedSec = timeElaspedNS / 1000000000;
    currentValue :=  currentValue * (1.000000025347 ** Float.fromInt(timeElaspedSec));
    startTime := currenTime;

  }
}