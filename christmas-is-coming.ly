
\header {
    title = \markup \center-column { \medium\larger
                                     "Christmas is Coming" }
    subtitle = \markup {\medium "(God bless you)"}
    composer = "trad. English carol"
    arranger = "arr. Frank Luther"
    tagline = ##f  % No 'Music engraving by LilyPond ...'
}

\version "2.24.0"

\paper{
  top-margin = 3\cm
  bottom-margin = 2\cm
  line-width = 148\mm
}

\layout {
  % Don't outdent after first line
  indent = 0\in
}

% Frank Luther arrangement.
Melody = \transpose es f { \relative c'' {
  \numericTimeSignature
  \time 4/4 {
    \key es \major
    g8.[ f16 g8. es16(]  f8.[ d16) c8.( bes16)]  es8.[ d16 es8. g16]  bes2
    % - hat
    aes8.[ g16 aes8. f16] g8.[ f16 es8. g16] f4 d bes
    % if you
    \tuplet 3/2 {r8 es8 f} g8.[ f16 g8. es16] f8.[ d16 c8.( bes16)]
    % ha penny will do
    es8.[ d16 es8. g16] bes4
    \tuplet 3/2 {r8 g g} aes8.[ g16 aes8. f16] g8.[ es16 c8. bes16] es4 es es r4
    % God blesss you, gentlemen,
    es' c bes \tuplet 3/2 {g8 f es} aes4 c bes
    \tuplet 3/2 {r8 g8 g} aes8.[ g16 aes8. f16] g8.[ es16 c8. bes16]
    es4 es es r
    %es es es f g aes8.[ g16 aes8. f16] g8.[ es16 c8. bes16] e4 e e2
  }
}
}

% Lyrics are a mix of the trad. carol and the Luther song.

verse = \lyricmode {
Christ -- mas is coming, the geese are get -- ing fat,
Plea -- se put a pen -- ny in an old man's hat.
If you have -- n't got a pen -- ny, a ha' pen -- ny will do,
If you have -- n't got a ha' pen -- nny, then God bless you.
God bless you, gen -- tle -- men, God bless you, If you have -- n't got a ha' pen -- ny then God bless you.
God bless you.
% If you have -- n't got a thing for me, may God bless you.
}

changes = \transpose es f { \chordmode {
  es2 bes:7 es g:m
  f:m7 es f:7 bes:7 es bes:7
  es g:m f4:m7 bes4:7 es aes es aes es2 es4
  aes4 es2 aes es f4:m7 bes:7 es aes
  es aes es
}
}

SimpleMelody = \transpose c f { \relative c' {
  \numericTimeSignature
  \time 4/4 {
    \key c \major
    c4 c8 d e4  c8 c  e8 d e f g2
    c4 g8 g g8 a g f  e4 d c g'8 g
    e8 g g g  g8 g4 g8  e8 c' b a  g4  g8 g
    e8 g g g  g8 g g g a4 b c r
  }
}
}

simpleverse = \lyricmode {
Christ -- mas is com -- in', the geese are get -- ing fat,
Please put a pen -- ny in an old man's hat.
If you have -- n't got a pen -- ny, a ha' pen -- ny will do,
If you have -- n't got a ha' pen -- nny, then God bless you.
God bless you, gen -- tle -- men, God bless you, If you have -- n't got a ha' pen -- ny then God bless you.
God bless you.
}

\score {
  <<
    \context ChordNames {
      \override ChordNames.ChordName.font-name = #"Century Schoolbook L"
      \set chordChanges = ##t
      \changes
    }
    \new Voice = "lead" {
      \Melody
    }
    % \new Voice = "follow" {
    %   \SimpleMelody
    % }
    \new Lyrics \lyricsto "lead" \verse
    % \new Lyrics \lyricsto "follow" \simpleverse
  >>
  \layout { }
  \midi {}
}

\markup {
  \vspace #10
  \fill-line { \epsfile #X #20 #"christmas-is-coming.eps" }
}