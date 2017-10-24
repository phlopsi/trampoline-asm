shared abstract class Trampoline<Type>()
        of Return<Type> | Call<Type>
        satisfies ResultProducer<Type> {}
