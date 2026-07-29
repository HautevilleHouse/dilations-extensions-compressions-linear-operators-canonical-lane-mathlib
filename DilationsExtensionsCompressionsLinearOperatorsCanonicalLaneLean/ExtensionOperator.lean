import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure ExtensionOperator (X Y : Type u) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  subspace : Submodule ℝ X
  operatorOnSubspace : subspace →ₗ[ℝ] Y
  extension : X →ₗ[ℝ] Y
  extendsOnSubspace : ∀ v : subspace, extension v = operatorOnSubspace v
  normPreserving : ‖extension‖ = ‖operatorOnSubspace‖

def ExtensionOperatorClosed {X Y : Type u} [NormedAddCommGroup X] [NormedAddCommGroup Y]
    (E : ExtensionOperator X Y) : Prop :=
  E.extendsOnSubspace ∧ E.normPreserving

theorem extension_operator_closed_from_evidence {X Y : Type u}
    [NormedAddCommGroup X] [NormedAddCommGroup Y] (E : ExtensionOperator X Y)
    (hext : ∀ v : E.subspace, E.extension v = E.operatorOnSubspace v)
    (hnorm : ‖E.extension‖ = ‖E.operatorOnSubspace‖) :
    ExtensionOperatorClosed E := by
  exact And.intro hext hnorm

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse