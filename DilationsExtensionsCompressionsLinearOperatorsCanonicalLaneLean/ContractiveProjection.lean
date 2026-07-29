import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean

structure ContractiveProjection (X : Type) [NormedAddCommGroup X] (P : X → X) where
  idempotent : ∀ x : X, P (P x) = P x
  contractive : ∀ x : X, ‖P x‖ ≤ ‖x‖
  linear : IsLinearMap ℝ P

structure ContractiveProjectionEvidence (P : ContractiveProjection X P) where
  idempotent_closed : P.idempotent
  contractive_closed : P.contractive
  linear_closed : P.linear

def ContractiveProjectionClosed (P : ContractiveProjection X P) : Prop :=
  P.idempotent ∧ P.contractive ∧ P.linear

theorem contractive_projection_closed_from_evidence
    (P : ContractiveProjection X P) (E : ContractiveProjectionEvidence P) :
    ContractiveProjectionClosed P := by
  exact And.intro E.idempotent_closed
    (And.intro E.contractive_closed E.linear_closed)

end DilationsExtensionsCompressionsLinearOperatorsCanonicalLaneLean
end HautevilleHouse