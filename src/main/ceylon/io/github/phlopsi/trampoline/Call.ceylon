shared abstract class Call<Type>()
        extends Trampoline<Type>() {
    suppressWarnings("expressionTypeNothing")
    shared actual Type result => nothing;
    
    shared formal Trampoline<Type> bounce();
}
