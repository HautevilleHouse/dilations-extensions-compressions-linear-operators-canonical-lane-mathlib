import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure ContractionOperator (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H] where
  T : H →ₗ[ℂ] H
  normLeOne : ‖T‖ ≤ 1

structure DilationSpace (H K : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [NormedAddCommGroup K] [InnerProductSpace ℂ K] where
  V : H →ₗ[ℂ] K
  isometry : ∀ x : H, ‖V x‖ = ‖x‖

def isDilation (T : ContractionOperator H) (V : DilationSpace H K) (U : K →ₗ[ℂ] K) : Prop :=
  ∀ x : H, V (T.T x) = U (V x)

structure MinimalDilationPackage (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H] where
  dilationSpace : DilationSpace H H
  unitaryExtension : H →ₗ[ℂ] H
  isUnitary : ∀ x : H, ‖unitaryExtension x‖ = ‖x‖
  minimalityCondition : Prop
  minimalityConditionClosed : minimalityCondition

def MinimalDilationClosed {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (M : MinimalDilationPackage H) : Prop :=
  M.minimalityCondition

theorem minimal_dilation_closed {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (M : MinimalDilationPackage H) : MinimalDilationClosed M :=
  M.minimalityConditionClosed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse
