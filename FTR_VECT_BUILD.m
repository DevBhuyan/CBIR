%function to vectorize glcm matrices to make 1x1024 vector

function glcm_ftr = FTR_VECT_BUILD(ip)
    f = ZP(ip);
    [glcm0, glcm45, glcm90, glcm135] = GLCM(CSLBP(f));
    glcm_ftr = [reshape(glcm0, [1, 256]), reshape(glcm45, [1, 256]), reshape(glcm90, [1, 256]), reshape(glcm135, [1, 256])];
end