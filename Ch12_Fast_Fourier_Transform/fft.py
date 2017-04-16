import math

def fft(rex, imx):
    n = len(rex)
    nm1 = n-1
    nd2 = int(n/2)
    m = int(math.log2(n)/math.log2(2))
    j = nd2

    # bit reversal
    rex_rev = bitrev(rex)
    # print(rex_rev)
    imx_rev = bitrev(imx)
    # print(imx_rev)

    # loop for each stage
    for l in range(1,m):
        le = int(2**l)
        le2 = int(le/2)
        ur = 1
        ui = 0
        sr = math.cos(math.pi / le2)
        si = -math.sin(math.pi / le2)

        # loop for each sub-dft
        for j in range(0, le2):
            jm1 = j-1
            # loop for each butterfly
            for i in range(jm1, nm1, le):
                ip = i + le2
                # butterfly
                tr = rex[ip] * ur - imx[ip] * ui
                ti = rex[ip] * ui + imx[ip] * ur
                rex[ip] = rex[i] - tr
                imx[ip] = imx[i] - ti
                rex[i] = rex[i] + tr
                imx[i] = imx[i] + ti
            tr = ur
            ur = tr * sr - ui * si
            ui = tr * si + ui * sr
    return [rex, imx]



def inverse_fft(rex, imx):
    n = len(rex)
    for k in range(0,n):
        imx[k] = -imx[k]

    [rex,imx] = fft(rex,imx)

    for i in range(0,n):
        rex[i] = rex[i] / n
        imx[i] = imx[i] / n

    return [rex, imx]




def bitrev(L):
    n = math.ceil(math.log2(len(L)))  # normalize binary numbers to this length
    # B = [bin(s)[2:].zfill(n) for s in L]
     
     # convert to binary, keep only numeric portion
    B = [bin(s).replace('0b','') for s in L]  
    # normalize to length n by prepending appropriate number of zeros, preserving negation when present
    B = [s.zfill(n) if s[0] != '-' else '-'+s[1:].zfill(n) for s in B]   
    
    for i in range(0, len(B)):
        try:
            # negative number matches on reversed negative only, positive on reversed positive only
            if (B[i][0] == '-'):                    # handle negatives
                j = B.index('-'+B[i][1:][::-1])     # extract numeric part, reverse it, then prepend neg sign & search
            else:                                   # handle positives
                j = B.index(B[i][::-1])
        except ValueError:  # no reverse match, skip to next iteration
            continue
        if j >= i:
            B[j], B[i] = B[i], B[j]
    return [int(b,2) for b in B]



if __name__ == "__main__":
    n = 16
    imx = [0]*n
    S1 = [math.sin(s) for s in range(0,n)]
    S2 = [2 * math.sin(2 * s + 2) for s in range(0,n)]
    rex = [int(a+b) for a,b in zip(S1,S2)]  # normalized to ints, dealing with binary floats requires lots of special handling...
    print(rex)
    print("="*50)

    [rex2, imx2] = fft(rex, imx)
    print(rex2)
    print(imx2)
    print("="*50)

    [rex3, imx3] = inverse_fft(rex2, imx2)
    print(rex3)
    print(imx3)
