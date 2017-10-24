import java.lang {
	ObjectArray,
	JString=String
}

import org.objectweb.asm {
	ClassVisitor,
	MethodVisitor,
	Opcodes,
	Label
}

Integer asm6 = Opcodes.asm6;

Integer aload = Opcodes.aload;
Integer areturn = Opcodes.areturn;
Integer checkcast = Opcodes.checkcast;
Integer dup = Opcodes.dup;
Integer ifne = Opcodes.ifne;
Integer instanceof = Opcodes.instanceof;
Integer invokevirtual = Opcodes.invokevirtual;

final class CallClassVisitor(ClassVisitor cv)
		extends ClassVisitor(asm6, cv) {
	class GetResultMethodVisitor(MethodVisitor methodVisitor)
			extends MethodVisitor(asm6) {
		visitAnnotation(String desc, Boolean visible)
				=> this.methodVisitor.visitAnnotation(desc, visible);
		
		shared actual void visitCode() {
			value label0 = Label();
			
			this.methodVisitor.visitVarInsn(aload, 0);
			this.methodVisitor.visitLabel(label0);
			this.methodVisitor.visitTypeInsn(checkcast, "io/github/phlopsi/trampoline/Call");
			this.methodVisitor.visitMethodInsn(invokevirtual, "io/github/phlopsi/trampoline/Call", "bounce",
				"()Lio/github/phlopsi/trampoline/Trampoline;", false);
			this.methodVisitor.visitInsn(dup);
			this.methodVisitor.visitTypeInsn(instanceof, "io/github/phlopsi/trampoline/Call");
			this.methodVisitor.visitJumpInsn(ifne, label0);
			this.methodVisitor.visitTypeInsn(checkcast, "io/github/phlopsi/trampoline/Return");
			this.methodVisitor.visitMethodInsn(invokevirtual, "io/github/phlopsi/trampoline/Return", "getResult",
				"()Ljava/lang/Object;", false);
			this.methodVisitor.visitInsn(areturn);
		}
		
		//		@Override
		//		public void visitCode() {
		//			Label label0 = new Label();
		//			Label label1 = new Label();
		//
		//			this.mv.visitVarInsn(Opcodes.ALOAD, 0);
		//			this.mv.visitLabel(label0);
		//			this.mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL, "io/github/phlopsi/trampoline/Call", "bounce",
		//					"()Lio/github/phlopsi/trampoline/Trampoline;", false);
		//			this.mv.visitInsn(Opcodes.DUP);
		//			this.mv.visitTypeInsn(Opcodes.INSTANCEOF, "io/github/phlopsi/trampoline/Call");
		//			this.mv.visitJumpInsn(Opcodes.IFEQ, label1);
		//			this.mv.visitTypeInsn(Opcodes.CHECKCAST, "io/github/phlopsi/trampoline/Call");
		//			this.mv.visitJumpInsn(Opcodes.GOTO, label0);
		//			this.mv.visitLabel(label1);
		//			this.mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL, "io/github/phlopsi/trampoline/Trampoline", "getResult",
		//					"()Ljava/lang/Object;", false);
		//			this.mv.visitInsn(Opcodes.ARETURN);
		//		}
		
		//		@Override
		//		public void visitCode() {
		//			Label label0 = new Label();
		//			Label label1 = new Label();
		//
		//			this.mv.visitVarInsn(Opcodes.ALOAD, 0);
		//			this.mv.visitLabel(label0);
		//			this.mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL, "io/github/phlopsi/trampoline/Call", "bounce",
		//					"()Lio/github/phlopsi/trampoline/Trampoline;", false);
		//			this.mv.visitVarInsn(Opcodes.ASTORE, 0);
		//			this.mv.visitVarInsn(Opcodes.ALOAD, 0);
		//			this.mv.visitTypeInsn(Opcodes.INSTANCEOF, "io/github/phlopsi/trampoline/Call");
		//			this.mv.visitJumpInsn(Opcodes.IFEQ, label1);
		//			this.mv.visitVarInsn(Opcodes.ALOAD, 0);
		//			this.mv.visitTypeInsn(Opcodes.CHECKCAST, "io/github/phlopsi/trampoline/Call");
		//			this.mv.visitJumpInsn(Opcodes.GOTO, label0);
		//			this.mv.visitLabel(label1);
		//			this.mv.visitVarInsn(Opcodes.ALOAD, 0);
		//			this.mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL, "io/github/phlopsi/trampoline/Trampoline", "getResult",
		//					"()Ljava/lang/Object;", false);
		//			this.mv.visitInsn(Opcodes.ARETURN);
		//		}
		
		visitFrame(Integer type, Integer nLocal, ObjectArray<Object>? local, Integer nStack, ObjectArray<Object>? stack)
				=> this.methodVisitor.visitFrame(type, nLocal, local, nStack, stack);
		
		visitMaxs(Integer maxStack, Integer maxLocals)
				=> this.methodVisitor.visitMaxs(maxStack, maxLocals);
	}
	
	visitMethod(Integer access, String name, String desc, String signature, ObjectArray<JString>? exceptions)
			=> switch (name)
				case ("getResult")
					GetResultMethodVisitor(super.visitMethod(access, name, desc.string, signature, exceptions))
				else
					super.visitMethod(access, name, desc, signature, exceptions);
}
