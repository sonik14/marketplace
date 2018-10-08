module ApplicationHelper
  protected
    def check_function_params
      if self.function_id.nil?
        self.parA = nil;
        self.parB = nil;
        self.parC = nil;
        self.parD = nil;
      else
        function = Function.find(self.function_id)
        changed = false
        unless function.parAdef.nil?
          if function.parAmin.nil?
            changed = true
            function.parAmin = -Float::INFINITY
          end
          if function.parAmax.nil?
            changed = true
            function.parAmax = Float::INFINITY
          end
          if function.parAscale.nil?
            changed = true
            function.parAscale = 2
          end
        end
        unless function.parBdef.nil?
          if function.parBmin.nil?
            changed = true
            function.parBmin = -Float::INFINITY
          end
          if function.parBmax.nil?
            changed = true
            function.parBmax = Float::INFINITY
          end
          if function.parBscale.nil?
            changed = true
            function.parBscale = 2
          end
        end
        unless function.parCdef.nil?
          if function.parCmin.nil?
            changed = true
            function.parCmin = -Float::INFINITY
          end
          if function.parCmax.nil?
            changed = true
            function.parCmax = Float::INFINITY
          end
          if function.parCscale.nil?
            changed = true
            function.parCscale = 2
          end
        end
        unless function.parDdef.nil?
          if function.parDmin.nil?
            changed = true
            function.parDmin = -Float::INFINITY
          end
          if function.parDmax.nil?
            changed = true
            function.parDmax = Float::INFINITY
          end
          if function.parDscale.nil?
            changed = true
            function.parDscale = 2
          end
        end
        if changed
          function.update_attributes(
            parAmin: function.parAmin,
            parAmax: function.parAmax,
            parAscale: function.parAscale,
            parBmin: function.parBmin,
            parBmax: function.parBmax,
            parBscale: function.parBscale,
            parCmin: function.parCmin,
            parCmax: function.parCmax,
            parCscale: function.parCscale,
            parDmin: function.parDmin,
            parDmax: function.parDmax,
            parDscale: function.parDscale
          )
        end

        cust_func = CustFunc.where(function_id: self.function_id, customer_id: self.customer_id).take if self.class.name.start_with?('Cust')
        unless cust_func.nil?
          changed = false
          if cust_func.parAdef.nil? && !function.parAdef.nil?
            changed = true
            cust_func.parAdef = function.parAdef
          end
          unless cust_func.parAdef.nil?
            if cust_func.parAmin.nil?
              changed = true
              cust_func.parAmin = function.parAmin
            end
            if cust_func.parAmax.nil?
              changed = true
              cust_func.parAmax = function.parAmax
            end
          end
          if cust_func.parBdef.nil? && !function.parBdef.nil?
            changed = true
            cust_func.parBdef = function.parBdef
          end
          unless cust_func.parBdef.nil?
            if cust_func.parBmin.nil?
              changed = true
              cust_func.parBmin = function.parBmin
            end
            if cust_func.parBmax.nil?
              changed = true
              cust_func.parBmax = function.parBmax
            end
          end
          if cust_func.parCdef.nil? && !function.parCdef.nil?
            changed = true
            cust_func.parCdef = function.parCdef
          end
          unless cust_func.parCdef.nil?
            if cust_func.parCmin.nil?
              changed = true
              cust_func.parCmin = function.parCmin
            end
            if cust_func.parCmax.nil?
              changed = true
              cust_func.parCmax = function.parCmax
            end
          end
          if cust_func.parDdef.nil? && !function.parDdef.nil?
            changed = true
            cust_func.parDdef = function.parDdef
          end
          unless cust_func.parDdef.nil?
            if cust_func.parDmin.nil?
              changed = true
              cust_func.parDmin = function.parDmin
            end
            if cust_func.parDmax.nil?
              changed = true
              cust_func.parDmax = function.parDmax
            end
          end

          self.cust_func_id = cust_func.id
          function = cust_func
          if changed
            function.update_attributes(
              parAdef: function.parAdef,
              parAmin: function.parAmin,
              parAmax: function.parAmax,
              parBdef: function.parBdef,
              parBmin: function.parBmin,
              parBmax: function.parBmax,
              parCdef: function.parCdef,
              parCmin: function.parCmin,
              parCmax: function.parCmax,
              parDdef: function.parDdef,
              parDmin: function.parDmin,
              parDmax: function.parDmax
            )
          end
        end

        if self.parA.nil?
          self.parA = function.parAdef
        else
          self.parA = self.parA.round(function.parAscale)
          if self.parA > function.parAmax
            self.parA = function.parAmax
          elsif self.parA < function.parAmin
            self.parA = function.parAmin
          end
        end
        if self.parB.nil?
          self.parB = function.parBdef
        else
          self.parB = self.parB.round(function.parBscale)
          if self.parB > function.parBmax
            self.parB = function.parBmax
          elsif self.parB < function.parBmin
            self.parB = function.parBmin
          end
        end
        if self.parC.nil?
          self.parC = function.parCdef
        else
          self.parC = self.parC.round(function.parCscale)
          if self.parC > function.parCmax
            self.parC = function.parCmax
          elsif self.parC < function.parCmin
            self.parC = function.parCmin
          end
        end
        if self.parD.nil?
          self.parD = function.parDdef
        else
          self.parD = self.parD.round(function.parDscale)
          if self.parD > function.parDmax
            self.parD = function.parDmax
          elsif self.parD < function.parDmin
            self.parD = function.parDmin
          end
        end
      end
    end
end
