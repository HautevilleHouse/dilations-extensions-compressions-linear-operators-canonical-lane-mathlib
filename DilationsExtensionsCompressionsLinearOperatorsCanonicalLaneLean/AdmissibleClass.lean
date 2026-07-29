import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure AdmittedOperatorObject where
  operator : Type
  bounded : Prop
  linear : Prop
  domainComplete : Prop
  conclusion : bounded ∧ linear ∧ domainComplete

structure AdmissibleClass where
  object : AdmittedOperatorObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.bounded ∧ A.object.linear ∧ A.object.domainComplete) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse