I represent a  type of compositing operation to apply when performing drawing operation

	OP_ADD
	OP_ATOP - The new shape is only drawn where it overlaps the existing canvas content.
	OP_COLOR - Preserves the luma of the bottom layer, while adopting the hue and chroma of the top layer.
	OP_COLOR_BURN - Divides the inverted bottom layer by the top layer, and then inverts the result.
	OP_COLOR_DODGE - Divides the bottom layer by the inverted top layer.
	OP_COUNT
	OP_DARKEN - Retains the darkest pixels of both layers.
	OP_DEST_ATOP - The existing canvas is only kept where it overlaps the new shape. The new shape is drawn behind the canvas content.
	OP_DEST_IN - The existing canvas content is kept where both the new shape and existing canvas content overlap. Everything else is made transparent.
	OP_DEST_OUT - The existing content is kept where it doesn't overlap the new shape.
	OP_DEST_OVER - New shapes are drawn behind the existing canvas content.
	OP_DIFFERENCE - Subtracts the bottom layer from the top layer or the other way round to always get a positive value.
	OP_EXCLUSION - Like difference, but with lower contrast.
	OP_HARD_LIGHT - A combination of multiply and screen like overlay, but with top and bottom layer swapped.
	OP_HUE - Preserves the luma and chroma of the bottom layer, while adopting the hue of the top layer.
	OP_IN - The new shape is drawn only where both the new shape and the destination canvas overlap. Everything else is made transparent.
	OP_LIGHTEN - Retains the lightest pixels of both layers.
	OP_LUMINOSITY - Preserves the hue and chroma of the bottom layer, while adopting the luma of the top layer.
	OP_MULTIPLY - The pixels are of the top layer are multiplied with the corresponding pixel of the bottom layer. A darker picture is the result.
	OP_OUT - The new shape is drawn where it doesn't overlap the existing canvas content.
	OP_OVER - This is the default setting and draws new shapes on top of the existing canvas content.
	OP_OVERLAY - A combination of multiply and screen. Dark parts on the base layer become darker, and light parts become lighter.
	OP_SATURATION - Preserves the luma and hue of the bottom layer, while adopting the chroma of the top layer.
	OP_SCREEN - The pixels are inverted, multiplied, and inverted again. A lighter picture is the result (opposite of multiply)
	OP_SOFT_LIGHT - A softer version of hard-light. Pure black or white does not result in pure black or white.
	OP_SOURCE
	OP_XOR - Shapes are made transparent where both overlap and drawn normal everywhere else.
	
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/globalCompositeOperation