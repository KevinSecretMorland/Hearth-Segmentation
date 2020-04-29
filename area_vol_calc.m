function [ A, V ] = area_vol_calc(binMap, imgInfo)
%Calcul of the volume and the surface of the detections

S = sum(sum(binMap));
A = S * imgInfo.PixelSpacing(1) * imgInfo.PixelSpacing(2);
V = A * (imgInfo.SliceThickness - 1) * 0.1;
end