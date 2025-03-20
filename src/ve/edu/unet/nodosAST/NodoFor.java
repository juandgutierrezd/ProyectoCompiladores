package ve.edu.unet.nodosAST;

public class NodoFor extends NodoBase{
    private String nombrevariable; //se tiene que verificar en la tabla de simbolos
    private NodoBase valorInicial;
    private NodoBase valorFinal;
    private NodoBase cuerpo;

    public NodoFor(String nombrevariable, NodoBase valorInicial, NodoBase valorFinal, NodoBase cuerpo) {
        super();
        this.nombrevariable = nombrevariable;
        this.valorInicial = valorInicial;
        this.valorFinal = valorFinal;
        this.cuerpo = cuerpo;
    }

    public String getNombreVariable() {
//        return new NodoAsignacion(nombrevariable);
        return nombrevariable;
    }

    public void setVariable(String nombrevariable){
        this.nombrevariable = nombrevariable;
    }

    public NodoBase getValorInicial() {
        return valorInicial;
    }

    public void setValorInicial(NodoBase valorInicial) {
        this.valorInicial = valorInicial;
    }

    public NodoBase getValorFinal() {
        return valorFinal;
    }

    public void setValorFinal(NodoBase valorFinal) {
        this.valorFinal = valorFinal;
    }

    public NodoBase getCuerpo() {
        return cuerpo;
    }

    public void setCuerpo(NodoBase cuerpo) {
        this.cuerpo = cuerpo;
    }
}

