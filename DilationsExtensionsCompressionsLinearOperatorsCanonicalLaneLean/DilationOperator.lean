import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure DilationOperatorPackage where
  HilbertSpace : Type u
  innerProduct : HilbertSpace → HilbertSpace → ℝ
  norm : HilbertSpace → ℝ
  boundedLinear : Type v
  normed : Prop
  innerProductDefined : Prop
  boundedLinearDefined : Prop

structure DilationOperatorEvidence (D : DilationOperatorPackage) where
  normedClosed : D.normed
  innerProductDefinedClosed : D.innerProductDefined
  boundedLinearDefinedClosed : D.boundedLinearDefined

def DilationOperatorClosed (D : DilationOperatorPackage) : Prop :=
  D.normed ∧ D.innerProductDefined ∧ D.boundedLinearDefined

theorem dilation_operator_closed_from_evidence (D : DilationOperatorPackage)
    (E : DilationOperatorEvidence D) : DilationOperatorClosed D := by
  exact And.intro E.normedClosed (And.intro E.innerProductDefinedClosed E.boundedLinearDefinedClosed)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse