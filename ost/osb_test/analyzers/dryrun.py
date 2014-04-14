from analyzer import OSTAnalyzer
from utils import timeseries as ts
from ..common.output import inform

class DryRunAnalyzer(OSTAnalyzer):
    
    def __init__(self, ost, expected, backend):
        inform('No mep file specified. Will only run simulation.', indent=1)
        self.backend = backend

    def __call__(self):
        return not self.backend.returncode













