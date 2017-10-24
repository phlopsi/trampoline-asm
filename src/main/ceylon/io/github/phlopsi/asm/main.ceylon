import io.github.phlopsi.trampoline {
	Call
}

import java.io {
	FileOutputStream
}
import java.lang {
	Types
}
import java.net {
	URL
}

import org.objectweb.asm {
	ClassWriter,
	ClassReader
}

shared void main() {
	URL url = let (
		callClass = Types.classForDeclaration(`class Call`),
		callClassLoader = callClass.classLoader,
		callClassPath = callClass.name.replace(".", "/") + ".class")
		callClassLoader.getResource(callClassPath);
	ClassWriter cw;
	
	try (inputStream = url.openStream()) {
		value cr = ClassReader(inputStream);
		cw = ClassWriter(cr, ClassWriter.computeFrames);
		value cv = CallClassVisitor(cw);
		cr.accept(cv, 0);
	}
	
	try (fos = FileOutputStream(url.toURI().path)) {
		fos.write(cw.toByteArray());
	}
}
