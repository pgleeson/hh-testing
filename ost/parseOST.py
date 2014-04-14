import yaml
from osb_test.backends import OSTBackends
from osb_test.analyzers import OSTAnalyzers

def parse_yaml(fname):
    with open(fname) as f:
        y = yaml.safe_load(f)
    return y


def parse_ost(ost_path):
    ost = parse_yaml(ost_path)
    engine = ost['engine']
    target = ost['target']
    impl = ost.get('implements')
    
    tests = []
    if impl:
        mepfile = impl['mep']
        observables = impl['observables']
        mep = parse_yaml(mepfile) 
        experiment = mep['experiments'][impl['experiment']]
    else:
        observables = {'dry':None} 
        experiment = {'expected':{'dry':None}}

    backend = OSTBackends[engine](target)
    for obsname, observable in observables.iteritems():
        expected = experiment['expected'][obsname]
        tests.append(OSTAnalyzers[obsname](observable, expected, backend))

    backend.run()
    return [t() for t in tests]
    


if __name__ == '__main__':
    import sys
    t = parse_ost(sys.argv[1])
    print 'Test results:', t
    exit(not all(t))
    
    












