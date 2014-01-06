class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def search

   #@reservations = Reservation.new 
   @user= User.new 
   
   #t = Time.zone.parse("2013-12-12 16:35:00")
   #@reservations = Reservation.where(:inicio =>t)

   #ahora con between

   iniciof = Time.zone.parse("2012-12-12 16:35:00")
   finf =  Time.zone.parse("2014-12-12 16:35:00")

   #iniciof = "2012-12-12 16:35:00"
   #finf =  "2014-12-12 16:35:00"

   @reservations = Reservation.where(:inicio =>  iniciof .. finf)

  end

  def index
 

  if cookies[:fecha]!= nil

  @date = cookies[:fecha]
     if @date.is_a?(String)

      @date = Time.zone.parse(@date)

    end

  cookies[:hora] = Integer(cookies[:hora])

  else
 
 cookies[:hora] = 0
 cookies[:fecha] = Time.now
 @date = cookies[:fecha]
 #@date = DateTime.parse(@date)


 end
  
       # @reservations = Reservation.all.order('created_at DESC')
   
    @user = User.new #para carga del login
    
     

      #@startweek= Date.new
    #@endweek = Date.new
    #@DIA = @date.strftime("%A")


   #algoritmo de calculo de semana
   

    # if  @date.monday?

    #    @startweek = @date
    #    @endweek = @date + 6.days

    # elsif @date.tuesday?
            
    #    @startweek = @date - 1.days
    #    @endweek = @date + 5.days
       
    # elsif @date.wednesday?
      
    #    @startweek = @date - 2.days
    #    @endweek = @date + 4.days

    # elsif @date.thursday?
      
    #    @startweek = @date - 3.days
    #    @endweek = @date + 3.days

    # elsif @date.friday?   

    #   @startweek = @date - 4.days
    #   @endweek = @date + 2.days

    # elsif @date.saturday?

    #     @startweek = @date - 5.days
    #     @endweek = @date + 1.days
    
    # elsif @date.sunday?    
      
    #   @startweek = @date - 6.days
    #   @endweek = @date 


    # end
  #fin del inteligent de semanas

  @vehicles = Vehicle.all #todos los vehiculos para prueba
  @drivers = Driver.all # todos los chofer solo para uso de prueba


#busqueda
 @startweek = @date.beginning_of_week
 @endweek = @date.end_of_week 

  
#todas las horas y fechas matrix

  @startweek = @startweek.beginning_of_day + (cookies[:hora]* 60 * 60 )
  @endweek = @endweek.beginning_of_day + (cookies[:hora]* 60 * 60 )
  
  #colocar aca la cookie del hora
 


  inicio = Time.zone.parse(@startweek.strftime("%c"))
  fin =Time.zone.parse(@endweek.strftime("%c"))

#buscar desde @startweek hasta @endweek todas las reservas
 

 
@reservations = Reservation.where(:inicio =>  inicio .. fin )


  @lunes =[]
  @martes =[]
  @miercoles =[]
  @jueves =[]
  @viernes =[]
  @sabado =[]
  @domingo =[]

  @lunes << @startweek 
  @martes << inicio  + 1.days 
  @miercoles << inicio  + 2.days 
  @jueves << inicio  + 3.days 
  @viernes << inicio  + 4.days 
  @sabado << inicio  + 5.days 
  @domingo << inicio  + 6.days 

  i= 0

  until i > 14 do
    
    @lunes << @lunes[i] + (15 * 60)
    @martes << @martes[i] + (15 * 60)
    @miercoles << @miercoles[i] + (15 * 60)
    @jueves << @jueves[i] + (15 * 60)
    @viernes << @viernes[i] + (15 * 60)
    @sabado << @sabado[i]  + (15 * 60)
    @domingo << @domingo[i] + (15 * 60)
    i = i+1

  end


 #estructura


 @drivers = Driver.all

 @vehicles =Vehicle.all

 #general
 
#listadochoferes en hora
 # listado de choferes todo el dia
#pasandolo al string para buena busqueda
 indice= 0
 while indice < 16
 
  @lunes[indice] = Time.zone.parse(@lunes[indice].strftime("%c"))
  @martes[indice] = Time.zone.parse(@martes[indice].strftime("%c"))
  @miercoles[indice] = Time.zone.parse(@miercoles[indice].strftime("%c"))
  @jueves[indice] = Time.zone.parse(@jueves[indice].strftime("%c"))
  @viernes[indice] = Time.zone.parse(@viernes[indice].strftime("%c"))
  @sabado[indice] = Time.zone.parse(@sabado[indice].strftime("%c"))
  @domingo[indice]= Time.zone.parse(@domingo[indice].strftime("%c"))

  indice=indice+1
 end 

  @reservasviernes =[]
  @reservaschoferlunes = []
  @reservasmartes = []
  @reservasmiercoles = []
  @reservasjueves = []
  @reservassabado = []
  @reservasdomingo= []
  listacounter = 0
  
 while listacounter < 16
  
  #@listachoferhora << [] 
  #cambiarlo por reservas lunes al nombre pq sirve para todo
  @reservaschoferlunes << Reservation.where("inicio <=  ?  AND fin > ?" ,@lunes[listacounter] , @lunes[listacounter])#antes teniamos @lunes[listacounter+1 apuntando al fin] 
  @reservasmartes << Reservation.where("inicio <=  ?  AND fin > ?" ,@martes[listacounter] , @martes[listacounter])
  @reservasmiercoles << Reservation.where("inicio <=  ?  AND fin > ?" ,@miercoles[listacounter] , @miercoles[listacounter])
  @reservasjueves << Reservation.where("inicio <=  ?  AND fin > ?" ,@jueves[listacounter] , @jueves[listacounter])
  @reservassabado << Reservation.where("inicio <=  ?  AND fin > ?" ,@sabado[listacounter] , @sabado[listacounter])
  @reservasdomingo<< Reservation.where("inicio <=  ?  AND fin > ?" ,@domingo[listacounter] , @domingo[listacounter])
  @reservasviernes << Reservation.where("inicio <=  ?  AND fin > ?" ,@viernes[listacounter] , @viernes[listacounter])
  listacounter = listacounter + 1 

 end


#@listachoferhora[0,0] << "hola" este funca


 
 #meterle un ciclo mas de las lista y cambiar @reservaschoferlunes[]
 #ciclo grande

#fin de ciclo de estructura choferes



@listachoferhora = Array.new
@listachoferhoramartes = Array.new
@listachoferhoramiercoles = Array.new
@listachoferhorajueves = Array.new
@listachoferhoraviernes = Array.new
@listachoferhorasabado = Array.new
@listachoferhoradomingo = Array.new

for j in 0..15

@listachoferhora << Array.new
@listachoferhoramartes << Array.new
@listachoferhoramiercoles << Array.new
@listachoferhorajueves << Array.new
@listachoferhoraviernes << Array.new
@listachoferhorasabado << Array.new
@listachoferhoradomingo << Array.new

  for i in 0..(@drivers.size-1)

      @listachoferhora[j][i]= "libre"
      @listachoferhoramartes[j][i]= "libre"
      @listachoferhoramiercoles[j][i]= "libre"
      @listachoferhorajueves[j][i]= "libre"
      @listachoferhoraviernes[j][i] = "libre"
      @listachoferhorasabado[j][i]= "libre"
      @listachoferhoradomingo[j][i]= "libre"

     
  end
 end

#hacer mas general esto de abajo meter todas las reservas en conjunto

@semana = Array.new

@semana << @reservaschoferlunes 
@semana <<  @reservasmartes 
@semana <<  @reservasmiercoles 
@semana <<  @reservasjueves 
@semana <<  @reservassabado 
@semana <<  @reservasdomingo
@semana <<  @reservasviernes 


@semanac = Array.new

@semanac << @listachoferhora
@semanac << @listachoferhoramartes
@semanac << @listachoferhoramiercoles 
@semanac << @listachoferhorajueves 
@semanac << @listachoferhoraviernes 
@semanac << @listachoferhorasabado 
@semanac << @listachoferhoradomingo 


#estructura para choferes


@diaa = 0

@semana.each do |dia|

  @horaa=0

      dia.each do |reservas|
       
          reservas.each do |reserva|
           
            @chof=0
            @drivers.each do |driver|
               
               if driver.id == reserva.driver_id && reserva.estado != "libre"

                #asignar
                @semanac[@diaa][@horaa][@chof]="ocupado"
                       
               end

              @chof=@chof+1

              end  
       
          end 
        @horaa=@horaa+1
      end

@diaa = @diaa +1 
end





#CICLO ESTRUCTURA VEHICULOS 



@listavehiculoshora = Array.new
@listavehiculoshoramartes = Array.new
@listavehiculoshoramiercoles = Array.new
@listavehiculoshorajueves = Array.new
@listavehiculoshoraviernes = Array.new
@listavehiculoshorasabado = Array.new
@listavehiculoshoradomingo = Array.new




for j in 0..15

@listavehiculoshora << Array.new
@listavehiculoshoramartes << Array.new
@listavehiculoshoramiercoles << Array.new
@listavehiculoshorajueves << Array.new
@listavehiculoshoraviernes << Array.new
@listavehiculoshorasabado << Array.new
@listavehiculoshoradomingo << Array.new

  for i in 0 ..(@vehicles.size-1)
      @listavehiculoshora[j][i]= "libre"
      @listavehiculoshoramartes[j][i]= "libre"
      @listavehiculoshoramiercoles[j][i]= "libre"
      @listavehiculoshorajueves[j][i]= "libre"
      @listavehiculoshoraviernes[j][i]= "libre"
      @listavehiculoshorasabado[j][i]= "libre"
      @listavehiculoshoradomingo[j][i]= "libre"
      
  end
 end

 @semanav = Array.new


@semanav << @listavehiculoshora 
@semanav << @listavehiculoshoramartes 
@semanav << @listavehiculoshoramiercoles 
@semanav << @listavehiculoshorajueves 
@semanav << @listavehiculoshoraviernes 
@semanav << @listavehiculoshorasabado 
@semanav << @listavehiculoshoradomingo 

@diaaa = 0

@semana.each do |dia|

@horaas=0
dia.each do |reservas|
 
    reservas.each do |reserva|

      @vehic=0
      @vehicles.each do |vehicle|
         
         if vehicle.id == reserva.vehicle_id && reserva.estado != "libre"

          #asignar
          @semanav[@diaaa][@horaas][@vehic]="ocupado"
                 
         end

        @vehic=@vehic+1

        end  
 
    end 
  @horaas=@horaas+1
end
@diaaa = @diaaa + 1
end



#para form de reserva 


@reservation = Reservation.new




end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @user= User.new
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @user= User.new
  end

  # GET /reservations/1/edit
  def edit

    @user= User.new
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @user= User.new


    #crear reservas del inicio al fin

    @reservation = Reservation.new(reservation_params)
    @reservation.estado = "en proceso"
    
    #inicio = Time.zone.parse(@reservation.inicio)
    #fin = Time.zone.parse(@reservation.fin)

    inicio = @reservation.inicio
    fin = @reservation.fin


    @check = Reservation.where("inicio <=  ?  AND fin > ? AND driver_id= ? AND vehicle_id= ?" , fin , inicio, @reservation.driver_id , @reservation.vehicle_id )

    if @check != []

       flash[:notice] = "error ya en uso, revise horario entre " + @reservation.inicio.strftime("%R") + " y " + @reservation.fin.strftime("%R") 
       redirect_to index 
    else

    respond_to do |format|
      if @reservation.save
       
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reservation }

      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end

  end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
 def androidreserva

   @reservas = Reservation.all
   
   

   render :json => {
      :reservas => @reservas
      

   }

      
 end

 def androidchofer

  @choferes = Driver.all 

  render :json => {
      
      :choferes => @choferes
      

   }

 end

 def androidvehiculo

  @vehicles = Vehicle.all

  render :json => {
      
      :vehicles => @vehicles

   }

 end



  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

def estadodia

      @user= User.new 


  if cookies[:fecha]!= nil

      @dia = cookies[:fecha]
  
     if @dia.is_a?(String)

      @dia = Time.zone.parse(@dia)

    end

  else
 
 
 cookies[:fecha] = Time.now
 @dia = cookies[:fecha]
 #@date = DateTime.parse(@date)


 end





      @dia = @dia.beginning_of_day


      @findia = @dia + (60*59*24)

      @dia = Time.zone.parse(@dia.strftime("%c"))
      @findia = Time.zone.parse(@findia.strftime("%c"))

      @reservations  = Reservation.where(:inicio => @dia .. @findia)
      

  end

  def semanamas
 
 
 
 cookies[:fecha] = Time.zone.parse(cookies[:fecha])
 cookies[:fecha] = cookies[:fecha] + (60*60*24*7)

 #cookies[:fecha] = cookies[:fecha].strftime("%c")
 # cookies[:fecha] = cookies[:fecha].strftime("%c")

  redirect_to index

  end

  def semanamenos

  #cookies[:fecha] = cookies[:fecha].strftime("%c")

  cookies[:fecha] = Time.zone.parse(cookies[:fecha])

  cookies[:fecha] = cookies[:fecha] - (60*60*24*7)  

  #cookies[:fecha] = cookies[:fecha].strftime("%c")


  redirect_to index  

  end

  def horamas0
  
  cookies[:hora]= 0

  redirect_to index

  end

  
  def horamas1

  cookies[:hora]= 4

  redirect_to index

  end

  def horamas2

  cookies[:hora]= 8

  redirect_to index  

  end

  def horamas3

  cookies[:hora]= 12

  redirect_to index  

  end

  def horamas4

  cookies[:hora]= 16

  redirect_to index  

  end

  def horamas5

  cookies[:hora]= 20

  redirect_to index  

  end

  def liberar
 
   @liberar = Reservation.find(params[:id])

   @liberar.estado =  "libre"

  @liberar.save

  #agregar mensaje de tanta liberacion

  redirect_to index

  end

  def ir 

    #tengo parametro fecha
  

    cookies[:fecha] = params[:fechat]

    cookies[:fecha] << " 00:00:00"

    #cookies[:fecha]["/"] = "-"

    

    #cookies[:fecha] = Time.zone.parse(cookies[:fecha])
   
    

    redirect_to '/estadodia'

  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:driver_id, :vehicle_id, :inicio, :fin, :descripcion)
    end



end
