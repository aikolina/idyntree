classdef KinDynComputations < SwigRef
  methods
    function this = swig_this(self)
      this = iDynTreeMEX(3, self);
    end
    function self = KinDynComputations(varargin)
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = iDynTreeMEX(1485, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.swigPtr = [];
      end
    end
    function delete(self)
      if self.swigPtr
        iDynTreeMEX(1486, self);
        self.swigPtr=[];
      end
    end
    function varargout = loadRobotModel(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1487, self, varargin{:});
    end
    function varargout = loadRobotModelFromFile(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1488, self, varargin{:});
    end
    function varargout = loadRobotModelFromString(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1489, self, varargin{:});
    end
    function varargout = isValid(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1490, self, varargin{:});
    end
    function varargout = setFrameVelocityRepresentation(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1491, self, varargin{:});
    end
    function varargout = getFrameVelocityRepresentation(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1492, self, varargin{:});
    end
    function varargout = getNrOfDegreesOfFreedom(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1493, self, varargin{:});
    end
    function varargout = getDescriptionOfDegreeOfFreedom(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1494, self, varargin{:});
    end
    function varargout = getDescriptionOfDegreesOfFreedom(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1495, self, varargin{:});
    end
    function varargout = getNrOfLinks(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1496, self, varargin{:});
    end
    function varargout = getNrOfFrames(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1497, self, varargin{:});
    end
    function varargout = getFloatingBase(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1498, self, varargin{:});
    end
    function varargout = setFloatingBase(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1499, self, varargin{:});
    end
    function varargout = model(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1500, self, varargin{:});
    end
    function varargout = getRobotModel(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1501, self, varargin{:});
    end
    function varargout = setJointPos(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1502, self, varargin{:});
    end
    function varargout = setRobotState(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1503, self, varargin{:});
    end
    function varargout = getWorldBaseTransform(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1504, self, varargin{:});
    end
    function varargout = getBaseTwist(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1505, self, varargin{:});
    end
    function varargout = getJointPos(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1506, self, varargin{:});
    end
    function varargout = getJointVel(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1507, self, varargin{:});
    end
    function varargout = getModelVel(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1508, self, varargin{:});
    end
    function varargout = getFrameIndex(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1509, self, varargin{:});
    end
    function varargout = getFrameName(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1510, self, varargin{:});
    end
    function varargout = getWorldTransform(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1511, self, varargin{:});
    end
    function varargout = getRelativeTransformExplicit(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1512, self, varargin{:});
    end
    function varargout = getRelativeTransform(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1513, self, varargin{:});
    end
    function varargout = getFrameVel(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1514, self, varargin{:});
    end
    function varargout = getFrameFreeFloatingJacobian(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1515, self, varargin{:});
    end
    function varargout = getFrameBiasAcc(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1516, self, varargin{:});
    end
    function varargout = getCenterOfMassPosition(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1517, self, varargin{:});
    end
    function varargout = getCenterOfMassVelocity(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1518, self, varargin{:});
    end
    function varargout = getCenterOfMassJacobian(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1519, self, varargin{:});
    end
    function varargout = getCenterOfMassBiasAcc(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1520, self, varargin{:});
    end
    function varargout = getAverageVelocity(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1521, self, varargin{:});
    end
    function varargout = getAverageVelocityJacobian(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1522, self, varargin{:});
    end
    function varargout = getCentroidalAverageVelocity(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1523, self, varargin{:});
    end
    function varargout = getCentroidalAverageVelocityJacobian(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1524, self, varargin{:});
    end
    function varargout = getLinearAngularMomentum(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1525, self, varargin{:});
    end
    function varargout = getLinearAngularMomentumJacobian(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1526, self, varargin{:});
    end
    function varargout = getCentroidalTotalMomentum(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1527, self, varargin{:});
    end
    function varargout = getFreeFloatingMassMatrix(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1528, self, varargin{:});
    end
    function varargout = inverseDynamics(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1529, self, varargin{:});
    end
    function varargout = generalizedBiasForces(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1530, self, varargin{:});
    end
    function varargout = generalizedGravityForces(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1531, self, varargin{:});
    end
  end
  methods(Static)
  end
end
