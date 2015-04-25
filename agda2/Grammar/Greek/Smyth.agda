module Grammar.Greek.Smyth where

open import Data.Char
open import Data.Maybe
open import Relation.Nullary using (¬_)

-- Smyth §§C,D
data Dialect : Set where
  Aeolic : Dialect -- Aeolic means Lesbian Aeolic; Alcaeus, Saphho; Theocritus idylls
  Boeotian : Dialect -- Aeolic with "many Doric ingredients"
  
  Doric : Dialect -- lyric poets, Pindar; Theocritus bucolic
  SevererDoric : Dialect -- Old Doric
  MilderDoric : Dialect -- New Doric
  
  Arcadian Cyprian Elean NWGreece : Dialect
  
  Ionic : Dialect
  Epic : Dialect -- Old Ionic (Homer, Hesiod)
  Homer : Dialect -- Same as Epic?
  NewIonic : Dialect -- Herodotus, Hippocrates; Archilochus (between New and Old)
  
  Attic : Dialect
  NewAttic : Dialect -- Aristophanes, Xenophon, Lysias, Isocrates, Aeschines, Demosthenes, Plato
  OldAttic : Dialect -- Aeschylus, Sophocles, Euripides (tragic poets), Thucydides

  Koine : Dialect -- Common

-- Smyth §1
data Letter : Set where
  α β γ δ ε ζ η θ ι κ λ′ μ ν ξ ο π ρ σ τ υ φ χ ψ ω : Letter

data LetterCase : Set where
  capital small : LetterCase

form : Letter → LetterCase → Char
form α capital = 'Α'
form α small = 'α'
form β capital = 'Β'
form β small = 'β'
form γ capital = 'Γ'
form γ small = 'γ'
form δ capital = 'Δ'
form δ small = 'δ'
form ε capital = 'Ε'
form ε small = 'ε'
form ζ capital = 'Ζ'
form ζ small = 'ζ'
form η capital = 'Η'
form η small = 'η'
form θ capital = 'Θ'
form θ small = 'θ'
form ι capital = 'Ι'
form ι small = 'ι'
form κ capital = 'Κ'
form κ small = 'κ'
form λ′ capital = 'Λ'
form λ′ small = 'λ'
form μ capital = 'Μ'
form μ small = 'μ'
form ν capital = 'Ν'
form ν small = 'ν'
form ξ capital = 'Ξ'
form ξ small = 'ξ'
form ο capital = 'Ο'
form ο small = 'ο'
form π capital = 'Π'
form π small = 'π'
form ρ capital = 'Ρ'
form ρ small = 'ρ'
form σ capital = 'Σ'
form σ small = 'σ'
form τ capital = 'Τ'
form τ small = 'τ'
form υ capital = 'Υ'
form υ small = 'υ'
form φ capital = 'Φ'
form φ small = 'φ'
form χ capital = 'Χ'
form χ small = 'χ'
form ψ capital = 'Ψ'
form ψ small = 'ψ'
form ω capital = 'Ω'
form ω small = 'ω'

-- Smyth §1 a
data PositionInWord : Set where
  start-of-word : PositionInWord
  middle-of-word : PositionInWord
  end-of-word : PositionInWord

data FinalForm : Set where
  final-form not-final-form : FinalForm

get-final-form : Letter → LetterCase → PositionInWord → FinalForm
get-final-form σ′ small end-of-word = final-form
get-final-form _ _ _ = not-final-form

-- Smyth §3
data OlderLetter : Set where
  Ϝ : OlderLetter
  Ϙ : OlderLetter
  ϡ : OlderLetter

-- Smyth §4
data Vowel : Letter → Set where
  α : Vowel α
  ε : Vowel ε
  η : Vowel η
  ι : Vowel ι
  ο : Vowel ο
  υ : Vowel υ
  ω : Vowel ω

data VowelLength : Set where
  short long : VowelLength

data VowelWithLength : ∀ {v} → Vowel v → VowelLength → Set where
  ᾰ : VowelWithLength α short
  ᾱ : VowelWithLength α long
  ε : VowelWithLength ε short
  η : VowelWithLength η long
  ῐ : VowelWithLength ι short
  ῑ : VowelWithLength ι long
  ο : VowelWithLength ο short
  ῠ : VowelWithLength υ short
  ῡ : VowelWithLength υ long
  ω : VowelWithLength ω long

-- Smyth §5,6
data Diphthong : Letter → Letter → Set where
  αι : Diphthong α ι
  ει-gen : Diphthong ε ι
  ει-sp : Diphthong ε ι
  οι : Diphthong ο ι
  ᾱͅ : Diphthong α ι
  ῃ : Diphthong η ι
  ῳ : Diphthong ω ι
  αυ : Diphthong α υ
  ευ : Diphthong ε υ
  ου-gen : Diphthong ο υ
  ου-sp : Diphthong ο υ
  ηυ : Diphthong η υ
  υι : Diphthong υ ι
  ωυ : Diphthong ω υ -- Smyth §5 D. New Ionic

-- Smyth §7
data TonguePosition : Set where
  closed closed-medium open-medium open′ closing opening : TonguePosition

tongue-position-vowel : ∀ {ℓ} → Vowel ℓ → TonguePosition
tongue-position-vowel α = open′
tongue-position-vowel ω = open-medium
tongue-position-vowel η = open-medium
tongue-position-vowel ε = closed-medium
tongue-position-vowel ο = closed-medium
tongue-position-vowel ι = closed
tongue-position-vowel υ = closed

tongue-position-diphthong : ∀ {ℓ₁ ℓ₂} → Diphthong ℓ₁ ℓ₂ → TonguePosition
tongue-position-diphthong d = closing

data RoundedLips : Set where
  rounded-lips not-rounded-lips : RoundedLips

rounded-lips-vowel : ∀ {ℓ} → Vowel ℓ → RoundedLips
rounded-lips-vowel ο = rounded-lips
rounded-lips-vowel υ = rounded-lips
rounded-lips-vowel ω = rounded-lips
rounded-lips-vowel _ = not-rounded-lips

rounded-lips-diphthong : ∀ {ℓ₁ ℓ₂} → Diphthong ℓ₁ ℓ₂ → RoundedLips
rounded-lips-diphthong ου-gen = rounded-lips
rounded-lips-diphthong _ = not-rounded-lips

-- Smyth §9
data Breathing : Set where
  ῾ ᾿ : Breathing

-- Smyth §15
data Consonant : Letter → Set where
  β : Consonant β
  γ : Consonant γ
  δ : Consonant δ
  ζ : Consonant ζ
  θ : Consonant θ
  κ : Consonant κ
  λ′ : Consonant λ′
  μ : Consonant μ
  ν : Consonant ν
  ξ : Consonant ξ
  π : Consonant π
  ρ : Consonant ρ
  σ : Consonant σ
  τ : Consonant τ
  φ : Consonant φ
  χ : Consonant χ
  ψ : Consonant ψ

data LetterCategory : Letter → Set where
  vowel : ∀ {ℓ} → Vowel ℓ → LetterCategory ℓ
  consonant : ∀ {ℓ} → Consonant ℓ → LetterCategory ℓ

Letter-to-LetterCategory : (ℓ : Letter) → LetterCategory ℓ
Letter-to-LetterCategory α = vowel α
Letter-to-LetterCategory β = consonant β
Letter-to-LetterCategory γ = consonant γ
Letter-to-LetterCategory δ = consonant δ
Letter-to-LetterCategory ε = vowel ε
Letter-to-LetterCategory ζ = consonant ζ
Letter-to-LetterCategory η = vowel η
Letter-to-LetterCategory θ = consonant θ
Letter-to-LetterCategory ι = vowel ι
Letter-to-LetterCategory κ = consonant κ
Letter-to-LetterCategory λ′ = consonant λ′
Letter-to-LetterCategory μ = consonant μ
Letter-to-LetterCategory ν = consonant ν
Letter-to-LetterCategory ξ = consonant ξ
Letter-to-LetterCategory ο = vowel ο
Letter-to-LetterCategory π = consonant π
Letter-to-LetterCategory ρ = consonant ρ
Letter-to-LetterCategory σ = consonant σ
Letter-to-LetterCategory τ = consonant τ
Letter-to-LetterCategory υ = vowel υ
Letter-to-LetterCategory φ = consonant φ
Letter-to-LetterCategory χ = consonant χ
Letter-to-LetterCategory ψ = consonant ψ
Letter-to-LetterCategory ω = vowel ω

LetterCategory-to-Letter : ∀ {ℓ} → LetterCategory ℓ → Letter
LetterCategory-to-Letter {ℓ} _ = ℓ

data VocalChords : Set where
  voiced voiceless : VocalChords

-- Smyth §15 a
data Voiced : ∀ {ℓ} → Consonant ℓ → Set where
  β : Voiced β
  δ : Voiced δ
  γ : Voiced γ
  λ′ : Voiced λ′
  ρ : Voiced ρ
  μ : Voiced μ
  ν : Voiced ν
  ζ : Voiced ζ
-- γ-nasal : Voiced

-- Smyth §15 b
data Voiceless : ∀ {ℓ} → Consonant ℓ → Set where
  π : Voiceless π
  τ : Voiceless τ
  κ : Voiceless κ
  φ : Voiceless φ
  θ : Voiceless θ
  χ : Voiceless χ
  σ : Voiceless σ
  ψ : Voiceless ψ
  ξ : Voiceless ξ
--  Smyth §15 a. ρ with the rough breathing is voiceless

-- Smyth §16
data PartOfMouthClass : Set where
  labial dental palatal : PartOfMouthClass

data Labial : ∀ {ℓ} → Consonant ℓ → Set where
  π : Labial π
  β : Labial β
  φ : Labial φ

data Dental : ∀ {ℓ} → Consonant ℓ → Set where
  τ : Dental τ
  δ : Dental δ
  θ : Dental θ

data Palatal : ∀ {ℓ} → Consonant ℓ → Set where
  κ : Palatal κ
  γ : Palatal γ
  χ : Palatal χ

data SmoothStop : ∀ {ℓ} → Consonant ℓ → Set where
  π : SmoothStop π
  τ : SmoothStop τ
  κ : SmoothStop κ

data MiddleStop : ∀ {ℓ} → Consonant ℓ → Set where
  β : MiddleStop β
  δ : MiddleStop δ
  γ : MiddleStop γ

data RoughStop : ∀ {ℓ} → Consonant ℓ → Set where
  φ : RoughStop φ
  θ : RoughStop θ
  χ : RoughStop χ

-- Smyth §17
data Spirant : ∀ {ℓ} → Consonant ℓ → Set where
  σ : Spirant σ

-- Smyth §18
data Liquid : ∀ {ℓ} → Consonant ℓ → Set where
  λ′ : Liquid λ′
  ρ : Liquid ρ

-- Smyth §19
data Nasal : ∀ {ℓ} → Consonant ℓ → Set where
  μ : Nasal μ
  ν : Nasal ν
--  γ-nasal : Nasal

-- Smyth §19 a
data GammaNasalCombo : ∀ {ℓ₁ ℓ₂} → Consonant ℓ₁ → Consonant ℓ₂ → Set where
  γκ : GammaNasalCombo γ κ
  γγ : GammaNasalCombo γ γ
  γχ : GammaNasalCombo γ χ
  γξ : GammaNasalCombo γ ξ

-- Smyth §20
data Semivowel : ∀ {ℓ} → Vowel ℓ → Set where
  ι̯ : Semivowel ι
  υ̯ : Semivowel υ

-- Smyth §20 b
data Sonant : ∀ {ℓ} → Consonant ℓ → Set where
  λ̥ : Sonant λ′
  μ̥ : Sonant μ
  ν̥ : Sonant γ
  ρ̥ : Sonant ρ
  σ̥ : Sonant σ

-- Smyth §21
data DoubleConsonant : ∀ {ℓ} → Consonant ℓ → Set where
  ζ : DoubleConsonant ζ
  ξ : DoubleConsonant ξ
  ψ : DoubleConsonant ψ

data _+_⇒DoubleConsonant⇒_ : ∀ {ℓ₁ ℓ₂ ℓ₃} → Consonant ℓ₁ → Consonant ℓ₂ → Consonant ℓ₃ → Set where
  σ+δ⇒ζ : σ + δ ⇒DoubleConsonant⇒ ζ -- Smyth §26 D. Aeolic has σδ for ζ
  δ+σ⇒ζ : δ + σ ⇒DoubleConsonant⇒ ζ

  κ+σ⇒ξ : κ + σ ⇒DoubleConsonant⇒ ξ
  γ+σ⇒ξ : γ + σ ⇒DoubleConsonant⇒ ξ
  χ+σ⇒ξ : χ + σ ⇒DoubleConsonant⇒ ξ

  π+σ⇒ψ : π + σ ⇒DoubleConsonant⇒ ψ
  β+σ⇒ψ : β + σ ⇒DoubleConsonant⇒ ψ
  φ+σ⇒ψ : φ + σ ⇒DoubleConsonant⇒ ψ

-- Smyth §27
data _⇒QuantitativeVowelGradation⇒_ : ∀ {ℓ₁ ℓ₂} {v₁ : Vowel ℓ₁} {v₂ : Vowel ℓ₂} → VowelWithLength v₁ short → VowelWithLength v₂ long → Set where
  ᾰ⇒η : ᾰ ⇒QuantitativeVowelGradation⇒ η
  ε⇒ᾱ : ε ⇒QuantitativeVowelGradation⇒ η
  ῐ⇒ῑ : ῐ ⇒QuantitativeVowelGradation⇒ ῑ
  ο⇒ω : ο ⇒QuantitativeVowelGradation⇒ ω
  ῠ⇒ῡ : ῠ ⇒QuantitativeVowelGradation⇒ ῡ

data VowelSound : VowelLength → Set where
  ᾰ ε ῐ ο ῠ : VowelSound short
  ᾱ η ῑ ῡ ω : VowelSound long
  αι ει-gen ει-sp οι ᾱͅ ῃ ῳ αυ ευ ου-gen ου-sp ηυ υι ωυ : VowelSound long

-- Smyth §28 D. Epic
data _⇒MetricalLengthening⇒_ : VowelSound short → VowelSound long → Set where
  ε⇒ει-sp : ε ⇒MetricalLengthening⇒ ει-sp
  ο⇒ου-sp : ο ⇒MetricalLengthening⇒ ου-sp
  ο⇒οι : ο ⇒MetricalLengthening⇒ οι -- spurious οι ? "rarely"
  ᾰ⇒ᾱ : ᾰ ⇒MetricalLengthening⇒ ᾱ
  ῐ⇒ῑ : ῐ ⇒MetricalLengthening⇒ ῑ
  ῠ⇒ῡ : ῠ ⇒MetricalLengthening⇒ ῡ

-- Smyth §31 Attic
data _+_⇒QuantitativeVowelGradation′⇒_ : ∀ {ℓ₁ ℓ₂} {v₁ : Vowel ℓ₁} {v₂ : Vowel ℓ₂} → Letter → VowelWithLength v₁ short → VowelWithLength v₂ long → Set where
  ε+ᾰ⇒ᾱ : ε + ᾰ ⇒QuantitativeVowelGradation′⇒ ᾱ
  ι+ᾰ⇒ᾱ : ι + ᾰ ⇒QuantitativeVowelGradation′⇒ ᾱ
  ρ+ᾰ⇒ᾱ : ρ + ᾰ ⇒QuantitativeVowelGradation′⇒ ᾱ

-- Smyth §§32,33
data _⇒DialectVocalicChange⇒_ : ∀ {ℓ₁ ℓ₂ len} {v₁ : Vowel ℓ₁} {v₂ : Vowel ℓ₂} → VowelWithLength v₁ len → VowelWithLength v₂ len → Set where
  η⇒ᾱ : η ⇒DialectVocalicChange⇒ ᾱ
  ε⇒ᾰ : ε ⇒DialectVocalicChange⇒ ᾰ

{-
  ᾰ ᾱ ε η ῐ ῑ ο ῠ ῡ ω 
  αι ει-gen ει-sp οι ᾱͅ ῃ ῳ αυ ευ ου-gen ου-sp ηυ υι ωυ
-}

-- TODO (needs a unified model)

-- Diphthong
-- Smyth §5 D. Ionic has ηυ for Attic αυ in some words

-- Accent
-- Smyth §4. All vowels with the circumflex (149) are long.

-- Diaeresis
-- Smyth §8. Diaeresis.—A double dot, the mark of diaeresis, may be written over ι or υ when these do not form a diphthong with the preceding vowel

-- Breathing
-- Smyth §9. Every initial vowel or diphthong has either the rough (῾) or the smooth (᾿) breathing.
-- Smyth §10. Initial υ (ῠ and ῡ) always has the rough breathing.
-- Smyth §11. Diphthongs take the breathing, as the accent (152), over the second vowel: αἱρέω hairéo I seize, αἴρω aíro I lift.
-- Smyth §11. But ᾳ, ῃ, ῳ take both the breathing and the accent on the first vowel, even when ι is written in the line (5): ᾄδω = Ἄιδω I sing… The writing ἀίδηλος (Ἀίδηλος) destroying shows that αι does not here form a diphthong
-- Smyth §12. In compound words (as in προορᾶν to foresee, from πρό + ὁρᾶν) the rough breathing is not written, though it must often have been pronounced
-- Smyth §13. Every initial ρ has the rough breathing
-- Smyth §13. Medial ρρ is written ῤῥ in some texts

-- Consonants
-- Smyth §15 c. ι̯ υ̯
-- Smyth §20 a. When ι and υ correspond to y and w (cp. minion, persuade) they are said to be unsyllabic; and, with a following vowel, make one syllable out of two.
-- Smyth §20 a. Initial ι̯ passed into ̔ (h), as in ἧπαρ liver, Lat. jecur; and into ζ in ζυγόν yoke
-- Smyth §20 a. Initial υ̯ was written ϝ
-- Smyth §20 a. Medial ι̯, υ̯ before vowels were often lost, as in τῑμά-(ι̯)ω I honour, βο (υ̯)-ός, gen. of βοῦ-ς ox, cow
-- Smyth §26. σ was usually like our sharp s; but before voiced consonants (15 a) it probably was soft, like z; thus we find both κόζμος and κόσμος on inscriptions.

-- Metrical lengthening
-- Smyth §28 D. A short syllable under the rhythmic accent (‘ictus’) is lengthened metrically: (1) in words having three or more short syllables: the first of three shorts (οὐλόμενος), the second of four shorts (ὑπείροχος), the third of five shorts (ἀπερείσια boundless); (2) in words in which the short ictus syllable is followed by two longs and a short (Οὐλύμποιο). A short syllable not under the rhythmic accent is lengthened when it is preceded and followed by a long; thus, any vowel preceded by ϝ (πνείω breathe = πνεϝω), ι or υ before a vowel (προθῡμῑ́ῃσι zeal).

-- Compound words
-- Smyth §29. The initial short vowel of a word forming the second part of a compound is often lengthened: στρατηγός general (στρατός army + ἄγειν to lead 887 d).