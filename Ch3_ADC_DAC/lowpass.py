def lowpass(signal, stopband):
    return [k for k in signal if float(k) <= stopband]

if __name__ == "__main__":
    from util import Util
    U = Util("lowpass")
    X = U.get_signal()
    U.tofile(lowpass(X, 2), 2)
    U.tofile(lowpass(X, 10), 10)
    U.tofile(lowpass(X, 100), 100)
    print("DONE!")