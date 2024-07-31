x1_3D = (2 * y + x) / 2;
y1_3D = (2 * y - x) / 2;

alpha = 360 - image_angle;
x2 = (x + cos(degtorad(alpha)) * image_xscale * 16);
y2 = (y + sin(degtorad(alpha)) * image_xscale * 16);

x2_3D = (2 * y2 + x2) / 2;
y2_3D = (2 * y2 - x2) / 2;