import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure OperatorAlgebra where
  space : Type u
  norm : space → ℝ
  multiplication : space → space → space
  involution : space → space
  unit : space
  normedAlgebra : Prop
  cstarIdentity : Prop
  normedAlgebraTerm : normedAlgebra
  cstarIdentityTerm : cstarIdentity

structure OperatorAlgebraEvidence (A : OperatorAlgebra) where
  normedAlgebraClosed : A.normedAlgebra
  cstarIdentityClosed : A.cstarIdentity

def OperatorAlgebraClosed (A : OperatorAlgebra) : Prop :=
  A.normedAlgebra ∧ A.cstarIdentity

theorem operator_algebra_closed_from_evidence (A : OperatorAlgebra) (E : OperatorAlgebraEvidence A) :
    OperatorAlgebraClosed A := by
  exact And.intro E.normedAlgebraClosed E.cstarIdentityClosed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse