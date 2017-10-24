shared final class Return<Type>(result)
        extends Trampoline<Type>() {
    shared actual Type result;
    
    string => "``className(this)``(`` this.result else "<null>" ``)";
}
