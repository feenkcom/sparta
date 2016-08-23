enum LightingAtts
{
   ATT_POINT_LIGHT_POSITION = 0,                   // Point3D

   ATT_SPOT_LIGHT_POSITION,                           // Point3D
   ATT_SPOT_LIGHT_POINTS_AT,                         // Point3D
   ATT_SPOT_LIGHT_FOCUS,                               // Float
   ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE,          // Float

   ATT_DISTANT_LIGHT_AZIMUTH,                        // Float
   ATT_DISTANT_LIGHT_ELEVATION,                     // Float

   ATT_LIGHTING_COLOR,                                  // Color
   ATT_LIGHTING_SURFACE_SCALE,                      // Float
   ATT_LIGHTING_KERNEL_UNIT_LENGTH,               // Size

   ATT_DIFFUSE_LIGHTING_DIFFUSE_CONSTANT,      // Float

   ATT_SPECULAR_LIGHTING_SPECULAR_CONSTANT,   // Float
   ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT    // Float
};