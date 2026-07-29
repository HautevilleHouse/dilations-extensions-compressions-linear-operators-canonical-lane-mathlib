import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean.OperatorAlgebra

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure IsometricDilationPackage (A : OperatorAlgebra) where
  extendingSpace : Type u
  extendingAlgebra : OperatorAlgebra
  embedding : A.space → extendingAlgebra.space
  isometric : Prop
  extendsRepresentation : Prop
  minimal : Prop
  isometricTerm : isometric
  extendsRepresentationTerm : extendsRepresentation
  minimalTerm : minimal

structure IsometricDilationEvidence {A : OperatorAlgebra} (D : IsometricDilationPackage A) where
  isometricClosed : D.isometric
  extendsRepresentationClosed : D.extendsRepresentation
  minimalClosed : D.minimal

def IsometricDilationClosed {A : OperatorAlgebra} (D : IsometricDilationPackage A) : Prop :=
  D.isometric ∧ D.extendsRepresentation ∧ D.minimal

theorem isometric_dilation_closed_from_evidence {A : OperatorAlgebra} (D : IsometricDilationPackage A) (E : IsometricDilationEvidence D) :
    IsometricDilationClosed D := by
  exact And.intro E.isometricClosed (And.intro E.extendsRepresentationClosed E.minimalClosed)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse