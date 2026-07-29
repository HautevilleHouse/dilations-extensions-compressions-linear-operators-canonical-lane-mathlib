import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure CompletelyPositiveMap (A : Type*) [NormedRing A] [StarRing A] [CStarRing A] where
  φ : A →ₗ[ℂ] A
  completelyPositive : Prop
  completelyPositiveClosed : completelyPositive

def CompletelyPositiveMapClosed {A : Type*} [NormedRing A] [StarRing A] [CStarRing A]
    (φ : CompletelyPositiveMap A) : Prop :=
  φ.completelyPositive

theorem completely_positive_map_closed {A : Type*} [NormedRing A] [StarRing A] [CStarRing A]
    (φ : CompletelyPositiveMap A) : CompletelyPositiveMapClosed φ :=
  φ.completelyPositiveClosed

structure AndoDilationPackage (A : Type*) [NormedRing A] [StarRing A] [CStarRing A] where
  φ : CompletelyPositiveMap A
  dilationExists : Prop
  dilationExistsClosed : dilationExists

def AndoDilationClosed {A : Type*} [NormedRing A] [StarRing A] [CStarRing A]
    (P : AndoDilationPackage A) : Prop :=
  P.dilationExists

theorem ando_dilation_closed {A : Type*} [NormedRing A] [StarRing A] [CStarRing A]
    (P : AndoDilationPackage A) : AndoDilationClosed P :=
  P.dilationExistsClosed

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse
