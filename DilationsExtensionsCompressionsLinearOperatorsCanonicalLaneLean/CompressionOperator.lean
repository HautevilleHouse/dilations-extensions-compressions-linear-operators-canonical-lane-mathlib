import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure CompressionOperator (X Y : Type u) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  subspace : Submodule ℝ X
  operator : X →ₗ[ℝ] Y
  compression : subspace →ₗ[ℝ] Y
  compressedOnSubspace : ∀ v : subspace, compression v = operator v
  normReduction : ‖compression‖ ≤ ‖operator‖

def CompressionOperatorClosed {X Y : Type u} [NormedAddCommGroup X] [NormedAddCommGroup Y]
    (C : CompressionOperator X Y) : Prop :=
  C.compressedOnSubspace ∧ C.normReduction

theorem compression_operator_closed_from_evidence {X Y : Type u}
    [NormedAddCommGroup X] [NormedAddCommGroup Y] (C : CompressionOperator X Y)
    (hcomp : ∀ v : C.subspace, C.compression v = C.operator v)
    (hnorm : ‖C.compression‖ ≤ ‖C.operator‖) :
    CompressionOperatorClosed C := by
  exact And.intro hcomp hnorm

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse