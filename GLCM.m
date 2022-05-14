%create a function for GLCM
%256x256 matrix req for original b/w images
%cslbp op may not require as many values
%EDIT: cslbp requires 0-15 gray levels

function [glcm0, glcm45, glcm90, glcm135] = GLCM(f)
    for i = 1:max(max(f))
        for j = 1:max(max(f))
            glcm0(i+1, j+1) = glcm_val0(i, j, f);
            glcm45(i+1, j+1) = glcm_val45(i, j, f);
            glcm90(i+1, j+1) = glcm_val90(i, j, f);
            glcm135(i+1, j+1) = glcm_val135(i, j, f);
        end
    end
end

function glcm_out = glcm_val0(i, j, f)
    ct = 0;
    for x = 1:size(f, 1)
        for y = 1:(size(f, 2)-1)
            if ((f(x, y)==i)&&(f(x, y+1)==j))
                ct = ct+1;
            end
        end
    end
    glcm_out = ct;
end

function glcm_out = glcm_val45(i, j, f)
    ct = 0;
    for x = 2:size(f, 1)
        for y = 1:(size(f, 2)-1)
            if ((f(x, y)==i)&&(f(x-1, y+1)==j))
                ct = ct+1;
            end
        end
    end
    glcm_out = ct;
end

function glcm_out = glcm_val90(i, j, f)
    ct = 0;
    for x = 2:size(f, 1)
        for y = 1:(size(f, 2))
            if ((f(x, y)==i)&&(f(x-1, y)==j))
                ct = ct+1;
            end
        end
    end
    glcm_out = ct;
end

function glcm_out = glcm_val135(i, j, f)
    ct = 0;
    for x = 2:size(f, 1)
        for y = 2:(size(f, 2))
            if ((f(x, y)==i)&&(f(x-1, y-1)==j))
                ct = ct+1;
            end
        end
    end
    glcm_out = ct;
end

