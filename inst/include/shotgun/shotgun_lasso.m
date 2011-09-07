%
%   Copyright [2011] [Aapo Kyrola, Joseph Bradley, Danny Bickson, Carlos Guestrin / Carnegie Mellon University]
%
%   Licensed under the Apache License, Version 2.0 (the "License");
%   you may not use this file except in compliance with the License.
%   You may obtain a copy of the License at
%
%       http://www.apache.org/licenses/LICENSE-2.0
%
%   Unless required by applicable law or agreed to in writing, software
%   distributed under the License is distributed on an "AS IS" BASIS,
%   WITHOUT WARRANTIES OR CONDITIONS OF Alogregprob->ny KIND, either express or implied.
%   See the License for the specific language governing permissions and
%   limitations under the License.
%
%
% Implementation of Lasso Shotgun-algorithm from paper:
% Joseph K. Bradley, Aapo Kyrola, Danny Bickson, and Carlos Guestrin (2011). 
%  "Parallel Coordinate Descent for L1-Regularized Loss Minimization." 
%     International Conference on Machine Learning (ICML 2011).
%
% Solves Lasso \arg \min_x |Ax-y|^2+lambda*|x|_1
% input: 
%   matrix A (design matrix)
%   y (observation vector)
%   lambda (regularization parameter)
%   nthreads (how many threads to use, 0 for automatic)
% output:
%   x  weight-vector

function [x] = shotgun_lasso(A,y,lambda, nthreads)
  threshold = 1e-4
  regpath = 0
  maxiter = 0
  if (~exist('nthreads'))
     nthreads = 0
  end
  x =   mex_shotgun(A,y,lambda,1,threshold,regpath,maxiter, nthreads);
end

