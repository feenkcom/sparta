Turbulence filter primitive creates an image using the Perlin turbulence function. It allows the synthesis of artificial textures like clouds or marble. For a detailed description the of the Perlin turbulence function, see "Texturing and Modeling", Ebert et al, AP Professional, 1994. The resulting image will fill the entire filter primitive subregion for this filter primitive.

https://www.w3.org/TR/SVG/filters.html#feTurbulenceElement

It is possible to create bandwidth-limited noise by synthesizing only one octave.

For fractalSum, you get a turbFunctionResult that is aimed at a range of -1 to 1 (the actual result might exceed this range in some cases). To convert to a color value, use the formula colorValue = ((turbFunctionResult * 255) + 255) / 2, then clamp to the range 0 to 255.

For turbulence, you get a turbFunctionResult that is aimed at a range of 0 to 1 (the actual result might exceed this range in some cases). To convert to a color value, use the formula colorValue = (turbFunctionResult * 255), then clamp to the range 0 to 255.

The following order is used for applying the pseudo random numbers. An initial seed value is computed based on attribute ‘seed’. Then the implementation computes the lattice points for R, then continues getting additional pseudo random numbers relative to the last generated pseudo random number and computes the lattice points for G, and so on for B and A.

Public API and Key Messages

- area:  
- baseFrequence:
- numOctaves:
- seed:
- stitchable:
- typeFractalNoise
- typeTurbulence