private - ffi
primDraw: aDrawTarget x: x y: y

	^ self ffiCall: #(void moz2d_text_run_draw(MozCanvas aDrawTarget, self, float x, float y))