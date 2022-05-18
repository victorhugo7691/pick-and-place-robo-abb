MODULE Module1
	CONST jointtarget PTSingularidade:=[[-9.4009,4.37568,-14.257,12.4786,40.8945,-14.2292],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget PTSeguranca:=[[426.07,-71.78,493.89],[0.305778,-0.0466014,0.947972,-0.0753435],[-1,-1,-1,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget PTProxPega:=[[299.49,202.85,443.27],[0.209807,-0.32529,0.913822,0.122872],[0,0,-1,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget PTProxPega10:=[[364.35,0.00,594.00],[0.5,0,0.866025,0],[0,0,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget Pega:=[[325.60,219.49,301.68],[0.0317335,-0.321381,0.942963,0.0807915],[0,0,-1,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	!***********************************************************
    !
    ! Module:  Module1
    ! Author: Victor Hugo B. S. Miranda
    !
    !***********************************************************
    PROC main() !In�cio do programa
        MoveAbsJ PTSingularidade\NoEOffs, v1000, z50, tool0; !Ponto de singularidade
        MoveJ PTSeguranca, v1000, z50, tool0; !Ponto de seguranca
        MoveJ PTProxPega, v1000, z50, tool0; !Ponto pr�ximo a caixa
        Pegar Pega; !Funcao para pegar
        
        WaitDI DiSaida, 1; !Sinal que indica que pode movimentar ate o ponto de interesse
        Reset DoPegou; !Limpa o led informativo sobre pegar
        WaitTime 1; !Tempo
        Set DoEmMovimento; !Led que indica movimento
        MoveL Offs(Pega, 0, -300, 50), v1000, z50, tool0; !Movimento
        WaitTime 1; !Tempo
        Reset DoEmMovimento;!Desliga o led que indica movimento
        Largar Pega; !Funcao para largar
       
        MoveL Offs(Pega, 0, -50, 100), v1000, z50, tool0; !Movimento para o fim
        Reset DoLargou; !Desliga o led que informa que a caixa foi deixada
        WaitTime 1; !Tempo
        Set DoEncerrou; !Liga o led enformando que encerrou a tarefa
    ENDPROC

    PROC Pegar(robtarget ponto)
        MoveL ponto, v1000, z50, tool0;
        WaitTime 1;
        MoveL Offs(ponto, 0, 0, 50), v1000, z50, tool0;
        !APROXIMA
        MoveL Offs(ponto, 0, -50, 50), v1000, z50, tool0;
        !DESCE
        Set DoPegou;
    ENDPROC
    
    PROC Largar(robtarget ponto)
        MoveL Offs(Pega, 0, -300, 0), v1000, z50, tool0;
        SET DoLargou;
        WaitTime 1;
    ENDPROC
    
    
ENDMODULE
