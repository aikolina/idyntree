classdef Wrench < iDynTree.SpatialForceVector
  methods
    function self = Wrench(varargin)
      self@iDynTree.SpatialForceVector(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = iDynTreeMEX(463, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.swigPtr = [];
      end
    end
    function varargout = plus(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(464, self, varargin{:});
    end
    function varargout = minus(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(465, self, varargin{:});
    end
    function varargout = uminus(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(466, self, varargin{:});
    end
    function delete(self)
      if self.swigPtr
        iDynTreeMEX(467, self);
        self.swigPtr=[];
      end
    end
  end
  methods(Static)
  end
end
