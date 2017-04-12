class Util:
    module_name = None

    def __init__(self, module_name):
        self.module_name = module_name

    def get_signal(self, filename=None):
        if (filename == None):
            name = "signal.txt"
        else:
            name = "%s.%s.txt" % (self.module_name, filename)
        with open(name) as f:
            L = f.read().splitlines()
        return [float(x) for x in L]

    def tofile(self, L):
        f = open("%s.txt" % self.module_name, "w")
        for x in L:
            f.write("%s \n" % x)
        f.close()

    def tofile(self, L, filename=None):
        if (filename == None):
            name = "%s.txt" % self.module_name
        else:
            name = "%s.%s.txt" % (self.module_name, filename)
        with open(name, "w") as f:
            for x in L:
                f.write("%s \n" % x)
        # f = open(name, "w")
        # for x in L:
        #     f.write("%s \n" % x)
        # f.close()