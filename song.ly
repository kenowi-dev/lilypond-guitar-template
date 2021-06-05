\version "2.20.0"

dinPaper = ##t
twoside = ##f

\include "lib/lilypond-guitar-bends/guitar.ily"
\include "lib/pdq/pdq.ily"

% Sets the minimum fret number.
% This is usefull to enforce a certain fingering on the tab notation.
fret = #(define-music-function (fret) (number?) 
          #{ \set TabStaff.minimumFret = #fret #})


symbols = {
  \numericTimeSignature
  \time 4/4
  \fret #0
  \set TabStaff.restrainOpenStrings = ##t 
  a4. b8 c4 d
}

\header {
  title = "Song Name"
  instrument = "Guitar"
  composer = "Composer"
  arranger = "arr. Arranger"
}

\paper {
    \partPaper
    ragged-bottom = ##t
    system-system-spacing.basic-distance = 20
  }

\score {
  \layout {
    \partLayout
    indent = 15\mm    
    \context {
      \Score
      \override VerticalAxisGroup.staff-staff-spacing.basic-distance = 14
    }
  }

  \midi {
    \tempo 4 = 60
  }

  \new StaffGroup <<
   \new Staff \relative c {
     \clef "treble_8"
     \tempo 4=60    
     \set Staff.midiInstrument = "acoustic guitar (nylon)"
     \symbols
   }
   \new TabStaff \relative c {     
     \symbols
   }
>>
}