from compiladoresVisitor import compiladoresVisitor
from compiladoresParser import compiladoresParser

class Walker (compiladoresVisitor) :
    def visitPrograma(self, ctx: compiladoresParser.ProgramaContext) :
        print("=-" * 20)
        print ("==> Comienza a caminar")
        tmp = super().visitPrograma(ctx)
        print ("FIn del recorrido")
        return tmp
    
    def visitDeclaracion(self, ctx: compiladoresParser) :
        print (ctx.getChild(0).getText() + " - " + ctx.getChild(1).getText())
        return None
    
    def visitBloque(self, ctx : compiladoresParser.BloqueContext) :
        print("Nuevo contexto")
        print (ctx.getText())
        return super().visitInstrucciones(ctx.getChild(1))
    
    def visitTerminal(self, node) :
       print("==>> Token" + node.getText())
       return super().visitTerminal(node)
   
   
    
        