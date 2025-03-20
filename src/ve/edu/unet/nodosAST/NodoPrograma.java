package ve.edu.unet.nodosAST;

public class NodoPrograma extends NodoBase{
    private NodoBase declSeq;
    private NodoBase stmtSeq;

    public NodoPrograma(NodoBase declSeq, NodoBase stmtSeq) {
        super();
        this.declSeq = declSeq;
        this.stmtSeq = stmtSeq;
    }

    public NodoPrograma(NodoBase stmtSeq) {
        super();
        this.declSeq = null;
        this.stmtSeq = stmtSeq;
    }

    public NodoBase getDeclSeq() {
        return declSeq;
    }
    public NodoBase getStmtSeq() {
        return stmtSeq;
    }



    public void setDeclSeq(NodoBase declSeq) {
        this.declSeq = declSeq;
    }
    public void getStmtSeq(NodoBase stmtSeq) {
        this.stmtSeq = stmtSeq;
    }
}
