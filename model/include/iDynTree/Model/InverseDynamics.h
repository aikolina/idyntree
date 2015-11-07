/*
 * Copyright (C) 2015 Fondazione Istituto Italiano di Tecnologia
 * Authors: Silvio Traversaro
 * CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT
 *
 */

#ifndef IDYNTREE_INVERSE_DYNAMICS_H
#define IDYNTREE_INVERSE_DYNAMICS_H

#include <iDynTree/Model/Indeces.h>

#include <iDynTree/Model/LinkState.h>

namespace iDynTree
{
    class Model;
    class Traversal;
    class FreeFloatingPos;
    class FreeFloatingPosVelAcc;
    class FreeFloatingGeneralizedTorques;

    bool RNEADynamicPhase(const iDynTree::Model & model,
                          const iDynTree::Traversal & traversal,
                          const iDynTree::FreeFloatingPosVelAcc & jointPosVelAcc,
                          const iDynTree::LinkVelAccArray & linksVelAccs,
                          const iDynTree::LinkExternalWrenches & linkExtForces,
                          iDynTree::LinkInternalWrenches       & linkIntWrenches,
                          iDynTree::FreeFloatingGeneralizedTorques & baseForceAndJointTorques);


}

#endif /* IDYNTREE_FORWARD_KINEMATICS_H */