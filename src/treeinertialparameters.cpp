/**
 * Copyright  (C)  2013 CoDyCo Project
 * Author: Silvio Traversaro
 * website: http://www.codyco.eu
 */



#include <Eigen/Core>
//#include <Eigen/Dense>

#include <kdl/rigidbodyinertia.hpp>
#include <kdl/tree.hpp>

#include "kdl_codyco/treeinertialparameters.hpp"
#include "kdl_codyco/regressor_loops.hpp"
#include "kdl_codyco/rnea_loops.hpp"
#include "kdl_codyco/position_loops.hpp"


namespace KDL {
namespace CoDyCo {

    void TreeInertialParametersRegressor::updateParams()
    {
        tree_param.resize(10*tree_graph.getNrOfLinks());
        
        inertialParametersVectorLoop(tree_graph,tree_param);
    }    
    
    Eigen::VectorXd TreeInertialParametersRegressor::getInertialParameters()
    {
        if( tree_param.rows() != 10*tree_graph.getNrOfLinks() ) updateParams();
        return tree_param;
    }
    
    bool TreeInertialParametersRegressor::changeInertialParameters(const Eigen::VectorXd & new_chain_param,  Tree& new_tree)
    {
        return false;
        SegmentMap::const_iterator root;
        root = tree.getRootSegment();
        new_tree = Tree(root->first);
        return changeInertialParametersRecursive(new_chain_param,new_tree,root,root->first);
    }
    /*
    //code modified from bool Tree::addTreeRecursive(..)
    bool TreeInertialParametersRegressor::changeInertialParametersRecursive(const Eigen::VectorXd & new_chain_param, Tree & new_tree, SegmentMap::const_iterator root, const std::string& hook_name) 
    {
        //Working segment object
        Segment seg;
        //get iterator for root-segment
        SegmentMap::const_iterator child;
        //try to add all of root's children
        for (unsigned int i = 0; i < root->second.children.size(); i++) {
            child = root->second.children[i];
            //Modify segment
            seg = child->second.segment;
            seg.setInertia(deVectorize(tree_param.segment(serial.getLinkId(child->first)*10,10)));
            
            //Try to add the modified child
            if (new_tree.addSegment(seg, hook_name)) {
                //if child is added, add all the child's children
                if (!(this->changeInertialParametersRecursive(new_chain_param,new_tree,child, child->first)))
                    //if it didn't work, return false
                    return false;
            } else
                //If the child could not be added, return false
                return false;
        }
        return true;
    }*/
    
    TreeInertialParametersRegressor::TreeInertialParametersRegressor(Tree & _tree,Vector grav,const TreeSerialization & serialization) : tree(_tree), 
																	  tree_graph(_tree,serialization),  
                                                                      ns(_tree.getNrOfSegments()),                                                                 
                                                                      X_b(ns),
                                                                      v(ns),
                                                                      a(ns)
    {
        //Initializing gravitational acceleration (if any)
        ag=-Twist(grav,Vector::Zero());
        
        tree_graph.compute_traversal(traversal);
        
        //Compiling indicator function;
        /*
        for(unsigned int j=0; j < ns; j++ ) {
            indicator_function[j] = std::vector<bool>(nj,false);
        }
        
        for(int l =(int)traversal.order.size()-1; l >= 0; l-- ) {
			LinkMap::const_iterator link = traversal.order[l];
			//Each link affects the dynamics of the joints from itself to the base
			LinkMap::const_iterator child_link = link;
			LinkMap::const_iterator parent_link=traversal.parent[link->getIndex()];
			do{
				if( child_link->getJunction(parent_link)->getNrOfDOFs() == 1 ) 
					indicator_function[link->getLinkIndex()][child_link->getJunction(parent_link)->getDOFIndex()] = true; 
				child_link = parent_link;
				parent_link = traversal.parent[child_link->getIndex()];
			} while( child_link != traversal.order[0] );
		}*/
             
    }
    

    int TreeInertialParametersRegressor::dynamicsRegressor( const JntArray &q, 
                                                    const JntArray &q_dot,
                                                    const JntArray &q_dotdot,  
                                                    const Twist& base_velocity, 
                                                    const Twist& base_acceleration,
                                                    Eigen::MatrixXd & dynamics_regressor)
    {
        if(q.rows()!=tree_graph.getNrOfDOFs() || q_dot.rows()!=tree_graph.getNrOfDOFs() || q_dotdot.rows()!=tree_graph.getNrOfDOFs() || dynamics_regressor.cols()!=10*ns || dynamics_regressor.rows()!=(6+tree_graph.getNrOfDOFs()))
            return -1;
		
		//kinematic loop
        rneaKinematicLoop(tree_graph,q,q_dot,q_dotdot,traversal,base_velocity,base_acceleration,v,a);
        
        //Frame orientation loop
        getFramesLoop(tree_graph,q,traversal,X_b);
        
        dynamicsRegressorLoop(tree_graph,q,traversal,X_b,v,a,dynamics_regressor);

		/*
        for(i=0;i<ns;i++) {
                        
            netWrenchRegressor_i = netWrenchRegressor(v[i],a[i]);
            
            dynamics_regressor.block(0,(int)(10*i),6,10) = WrenchTransformationMatrix(X_b[i])*netWrenchRegressor_i;

            Frame X_j_i;
            for(j=0;j<ns;j++) {
                X_j_i = X_b[j].Inverse()*X_b[i];
                
                if( seg_vector[j]->second.segment.getJoint().getType() != Joint::None ) {
                    if( indicator_function[i][link2joint[j]] ) {
                        dynamics_regressor.block(6+link2joint[j],10*i,1,10) = 
                            toEigen(S[j]).transpose()*WrenchTransformationMatrix(X_j_i)*netWrenchRegressor_i;
                    }
                }
            }
        }*/

        return 0;
        
    }
}
}//namespace

