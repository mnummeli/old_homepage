OSCULATION ALGORITHM PACKAGE - MATLAB version
=============================================

(c) Mikko Nummelin, 2008

This is a conformal mapping algorithm package written in MATLAB. It is written
solely for demonstrating purposes of most important osculation algorithms,
used to prove the Riemann Mapping Theorem. The implementations are not
the most efficient nor complete for conformal mapping purposes, in fact these
are extremely slow in interpreted environments, especially in GNU Octave.

It is allowed to freely distribute, use and modify these source codes if
original author or authors are mentioned and modified versions also given
available to others.


Algorithms:

(1) Standard square-root Koebe algorithm:

This is based on taking appropriate automorphisms of the unit disk and
holomorphic square roots. The original region fills slowly more and more
of the unit disk and each submapping is conformal. See

koebe_*.m

(2) Logarithmic Koebe algorithm:

This is based on subsequent Cayley transformations and holomorphic
logarithms. It is slightly more effective than (1). See

logkoebe_*.m

(3) Sinh-log Koebe algorithm:

This is in theory (2) with one added scaling in left halfplane and
taking hyperbolic sine. In practice such implementation would be extremely
unstable because of exponential cumulation of errors. This implementation
uses appropriate polar coordinate transforms and half disk maps as a remedy.
See

sinhlog_*.m


In general, see

labyrinth_SC_*.m
