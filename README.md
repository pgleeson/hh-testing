HH model with OSB model validation
==========================================

[![Build Status](https://travis-ci.org/borismarin/hh-testing.svg)](https://travis-ci.org/borismarin/hh-testing)


Sample [OpenSourceBrain](http://www.opensourcebrain.org/) project, containing [LEMS/NeuroML2](http://www.neuroml.org/lems/) and [NEURON](http://www.neuron.yale.edu/neuron/) implementations of the [Hodking-Huxley model](en.wikipedia.org/wiki/Hodgkin–Huxley_model), validate using the [OSB model validation framework](https://github.com/borismarin/osb-testing-framework/). 

Each one of the simulators is downloaded and built in a travis worker, and tests specified via [omt](NEURON/hh.nrn.omt)/[mep](hh.mep) files are run. 
