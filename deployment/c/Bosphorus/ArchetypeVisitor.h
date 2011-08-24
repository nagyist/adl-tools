#pragma once
#include "IArchetypeVisitor.h"
#include "jni.h"
#include "ExperimentalApplicationEiffelAccessHelper.h"
#include <stack>
#include "JavaAOMHelper.h"

using namespace std;

//jni related resources should not be cached, so this visitor should be used per call from JAVA side
class ArchetypeVisitor : public IArchetypeVisitor
{
public:
	ArchetypeVisitor(void);
	ArchetypeVisitor(JNIEnv*, jobject);
	~ArchetypeVisitor(void);

	void setExperimentalAppHelper(ExperimentalApplicationEiffelAccessHelper*);
	
	void startCComplexObject(EIF_REFERENCE, EIF_INTEGER);
	void endCComplexObject(EIF_REFERENCE, EIF_INTEGER);

	void startArchetypeSlot(EIF_REFERENCE, EIF_INTEGER);
	void endArchetypeSlot(EIF_REFERENCE, EIF_INTEGER);

	void startCAttribute(EIF_REFERENCE, EIF_INTEGER);
	void endCAttribute(EIF_REFERENCE, EIF_INTEGER);

	void startCLeafObject(EIF_REFERENCE, EIF_INTEGER);
	void endCLeafObject(EIF_REFERENCE, EIF_INTEGER);

	void startCReferenceObject(EIF_REFERENCE, EIF_INTEGER);
	void endCReferenceObject(EIF_REFERENCE, EIF_INTEGER);

	void startCArchetypeRoot(EIF_REFERENCE, EIF_INTEGER);
	void endCArchetypeRoot(EIF_REFERENCE, EIF_INTEGER);

	void startArchetypeInternalRef(EIF_REFERENCE, EIF_INTEGER);
	void endArchetypeInternalRef(EIF_REFERENCE, EIF_INTEGER);

	void startConstraintRef(EIF_REFERENCE, EIF_INTEGER);
	void endConstraintRef(EIF_REFERENCE, EIF_INTEGER);

	void startCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER);
	void endCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER);

	void startCDomainType(EIF_REFERENCE, EIF_INTEGER);
	void endCDomainType(EIF_REFERENCE, EIF_INTEGER);

	void startCCodePhrase(EIF_REFERENCE, EIF_INTEGER);
	void endCCodePhrase(EIF_REFERENCE, EIF_INTEGER);

	void startCOrdinal(EIF_REFERENCE, EIF_INTEGER);
	void endCOrdinal(EIF_REFERENCE, EIF_INTEGER);

	void startCQuantity(EIF_REFERENCE, EIF_INTEGER);
	void endCQuantity(EIF_REFERENCE, EIF_INTEGER);	

private:	 
	void backupAndResetObjectAttributes();
	void restoreObjectAttributes();

	void backupAndResetJavaAomHelpers();
	void restoreJavaAomHelpers();
	string int2String(int);

	JNIEnv* env;
	jobject obj;
	ExperimentalApplicationEiffelAccessHelper* helper;
	std::stack<EIF_OBJECT> *objectAttributes;
	std::stack<EIF_OBJECT> *tempObjectAttributes;
	std::stack<JavaAOMHelper*> *javaAomHelpers;
	std::stack<JavaAOMHelper*> *tempJavaAomHelpers;
};
