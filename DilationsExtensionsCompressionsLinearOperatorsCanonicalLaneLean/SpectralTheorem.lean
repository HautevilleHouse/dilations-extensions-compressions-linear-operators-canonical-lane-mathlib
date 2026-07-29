import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure SpectralTheoremPackage {D : DilationOperatorPackage}
    (E : ExtensionCompressionPackage D) where
  selfAdjointOperator : D.boundedLinear
  spectralMeasure : Type u
  spectralResolution : Prop
  functionalCalculus : Prop
  diagonalization : Prop

structure SpectralTheoremEvidence {D : DilationOperatorPackage}
    {E : ExtensionCompressionPackage D} (S : SpectralTheoremPackage E) where
  spectralResolutionClosed : S.spectralResolution
  functionalCalculusClosed : S.functionalCalculus
  diagonalizationClosed : S.diagonalization

def SpectralTheoremClosed {D : DilationOperatorPackage}
    {E : ExtensionCompressionPackage D} (S : SpectralTheoremPackage E) : Prop :=
  S.spectralResolution ∧ S.functionalCalculus ∧ S.diagonalization

theorem spectral_theorem_closed_from_evidence {D : DilationOperatorPackage}
    {E : ExtensionCompressionPackage D} (S : SpectralTheoremPackage E)
    (Ev : SpectralTheoremEvidence S) : SpectralTheoremClosed S := by
  exact And.intro Ev.spectralResolutionClosed
    (And.intro Ev.functionalCalculusClosed Ev.diagonalizationClosed)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse