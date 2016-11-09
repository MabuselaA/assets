/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package thuli;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Thulisile
 */
@Stateless
public class AssetsFacade extends AbstractFacade<Assets> {
    @PersistenceContext(unitName = "whatevernamePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AssetsFacade() {
        super(Assets.class);
    }
    
}
