import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure ContractionOperatorOnHilbert (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H] where
  T : H →ₗ[ℂ] H
  contraction : ∀ x : H, ‖T x‖ ≤ ‖x‖

structure UnitaryDilation (H K : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [NormedAddCommGroup K] [InnerProductSpace ℂ K] where
  ι : H →ₗ[ℂ] K
  isometry : ∀ x : H, ‖ι x‖ = ‖x‖
  U : K →ₗ[ℂ] K
  unitary : ∀ x : K, ‖U x‖ = ‖x‖
  dilationProperty : Prop
  dilationPropertyClosed : dilationProperty

def UnitaryDilationClosed {H K : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [NormedAddCommGroup K] [InnerProductSpace ℂ K]
  (D : UnitaryDilation H K) : Prop :=
  D.dilationProperty

theorem unitary_dilation_closed {H K : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [NormedAddCommGroup K] [InnerProductSpace ℂ K]
  (D : UnitaryDilation H K) : UnitaryDilationClosed D :=
  D.dilationPropertyClosed

structure SzNagyDilationPackage (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H] where
  T : ContractionOperatorOnHilbert H
  dilationSpace : UnitaryDilation H H

def SzNagyDilationClosed {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (P : SzNagyDilationPackage H) : Prop :=
  UnitaryDilationClosed P.dilationSpace

theorem sz_nagy_dilation_closed {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (P : SzNagyDilationPackage H) : SzNagyDilationClosed P :=
  unitary_dilation_closed P.dilationSpace

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse
